require 'dry-types'
require 'dry-struct'

module Tapioca
  module Compilers
    class DryTypes < Tapioca::Dsl::Compiler
      extend ::T::Sig

      ConstantType = type_member {{ fixed: ::T.class_of(::Dry::Struct) }}

      sig { override.returns(::T::Enumerable[Module]) }
      def self.gather_constants
        all_classes.select { |c| c < ::Dry::Struct }
      end

      sig { override.void }
      def decorate
        compiler = ::DryAstCompiler.new
        root.create_path(constant) do |klass|
          constant.schema.each do |s|
            attribute_info = compiler.visit(s.to_ast)
            sorbet_type = self.class.to_sorbet_type(attribute_info[:type], attribute_info[:required])
            klass.create_method(
              attribute_info[:name],
              return_type: sorbet_type,
            )
          end
        end
      end

      def self.to_sorbet_type(type, required)
        base = if type.is_a?(::DryAstCompiler::Sum)
                 sum_to_sorbet_type(type)
               elsif type.is_a?(::DryAstCompiler::Undefined)
                 '::T.untyped'
               elsif type.is_a?(::Array)
                 "::T::Array[#{to_sorbet_type(type[0], true)}]"
               elsif type == ::Hash
                 '::T::Hash[::T.untyped, ::T.untyped]'
               elsif type == ::Time
                 ENV['PREFER_PLAIN_TIME'] ? '::Time' : '::ActiveSupport::TimeWithZone'
               elsif type == ::Range
                 '::T::Range[::T.untyped]'
               elsif type == ::Set
                 '::T::Set[::T.untyped]'
               elsif type == ::TrueClass || type == ::FalseClass
                 '::T::Boolean'
               elsif type.nil?
                 '::NilClass'
               else
                 "::#{type.name}"
               end
        if base == '::T.untyped' || base == '::NilClass'
          base
        else
          if required
            base
          else
            if base.start_with?('::T.nilable')
              base
            else
              "::T.nilable(#{base})"
            end
          end
        end
      end

      def self.sum_to_sorbet_type(sum)
        return '::T.untyped' if sum.include_undefined?

        nilable = false
        if sum.include_nilclass?
          sum.delete_nilclass!
          if sum.size < 2
            "::T.nilable(#{to_sorbet_type(sum.types[0], true)})"
          elsif (sum.types - [::TrueClass, ::FalseClass]).empty?
            '::T.nilable(::T::Boolean)'
          else
            "::T.nilable(::T.any(#{sum.types.map { |t| to_sorbet_type(t, true)}.join(', ')}))"
          end
        else
          if (sum.types - [::TrueClass, ::FalseClass]).empty?
            '::T::Boolean'
          else
            "::T.any(#{sum.types.map { |t| to_sorbet_type(t, true)}.join(', ')})"
          end
        end
      end
    end
  end
end

class DryAstCompiler
  class Undefined
    def to_s
      'Undefined'
    end
    def inspect
      to_s
    end
  end

  class Sum
    attr_reader :types
    def initialize(types= [])
      @types = types
    end
    def <<(arg)
      if arg.is_a?(Sum)
        arg.types.each { |t| @types << t }
      else
        @types << arg
      end
    end
    def size
      @types.size
    end
    def include_undefined?
      @types.any? { |t| t.is_a?(Undefined) }
    end
    def include_nilclass?
      @types.include?(::NilClass)
    end
    def delete_nilclass!
      @types.reject! { |t| t == ::NilClass }
    end
    def to_s
      "Sum(#{@types.map(&:to_s).join(',')})"
    end
    def inspect
      to_s
    end
  end

  def visit(node)
    meth, rest = node
    public_send(:"visit_#{meth}", rest)
  end

  def visit_key(node)
    name, required, rest = node
    {
      name: name,
      required: required,
      type: visit(rest)
    }
  end

  def visit_constructor(node)
    a, _ = node
    visit(a)
  end

  def visit_struct(node)
    type, _ = node
    type
  end

  def visit_sum(node)
    type = Sum.new
    node.each do |n|
      next if n.is_a?(::Hash)
      type << visit(n)
    end
    type
  end

  def visit_array(node)
    type = visit(node[0])
    [type]
  end

  def visit_constrained(node)
    types = node.map { |r| visit(r) }.reject { |x| x.nil? }
    types.size == 1 ? types[0] : types
  end

  def visit_nominal(node)
    type, _option = node
    type
  end

  def visit_predicate(node)
    # NOP
  end

  def visit_schema(node)
    ::Hash
  end

  def visit_hash(node)
    ::Hash
  end

  def visit_any(node)
    Undefined.new
  end
end

