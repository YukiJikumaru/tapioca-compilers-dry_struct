require 'dry-types'
require 'dry-struct'

module Tapioca
  module Compilers
    class DryTypes < Tapioca::Dsl::Compiler
      extend T::Sig

      ConstantType = type_member {{ fixed: T.class_of(Encryptable) }}

      sig { override.returns(T::Enumerable[Module]) }
      def self.gather_constants
        all_classes.select { |c| c < ::Dry::Struct }
      end

      sig { override.void }
      def decorate
        compiler = TypeCompiler.new
        root.create_path(constant) do |klass|
          constant.schema.each do |s|
            attribute_info = compiler.visit(s.to_ast)
            puts attribute_info.inspect
            puts
            sorbet_type = TypeCompiler.to_sorbet_type(attribute_info[:type], attribute_info[:required])
            # puts "#{attribute_info[:name]}"
            puts <<~EOF
            sig { returns(#{sorbet_type}) }
            def #{attribute_info[:name]}; end

            EOF
            # klass.create_method(
            #   attribute_info[:name],
            #   return_type: TypeCompiler.to_sorbet_type(attribute_info[:type], attribute_info[:required]),
            # )
          end
        end
      end
    end
  end
end

class TypeCompiler
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
    def to_s
      @types.find { |t| }
      "Sum(#{@types.map(&:to_s).join(',')})"
    end
    def inspect
      to_s
    end
    def to_sorbet_type
      return 'T.untyped' if @types.find { |t| t.is_a?(Undefined) }
      nilable = false
      if @types.find { |t| t == NilClass }
        @types.reject! { |t| t == NilClass }
        if @types.size < 2
          "::T.nilable(#{TypeCompiler.to_sorbet_type(@types[0], true)})"
        else
          "::T.nilable(T.any(#{@types.map { |t| TypeCompiler.to_sorbet_type(t, true)}.join(', ')}))"
        end
      else
        "::T.any(#{@types.map { |t| TypeCompiler.to_sorbet_type(t, true)}.join(', ')})"
      end
    end
  end

  def visit(node)
    meth, rest = node
    public_send(:"visit_#{meth}", rest)
  end

  def visit_key(node)
    name, required, rest = node
    result = {
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

  def visit_any(node)
    Undefined.new
  end

  def self.to_sorbet_type(type, required)
    base = if type.is_a?(Sum)
             type.to_sorbet_type
           elsif type.is_a?(Undefined)
             '::T.untyped'
           elsif type.is_a?(::Array)
             "::T::Array[#{to_sorbet_type(type[0], true)}]"
           elsif type == ::Hash
             '::T::Hash[::T.untyped, ::T.untyped]'
           elsif type == ::Time
             '::T.any(::Time, ::ActiveSupport::TimeWithZone)'
           elsif type == ::Range
             '::T::Range[::T.untyped]'
           elsif type == ::Set
             '::T::Set[::T.untyped]'
           elsif type == TrueClass || type == FalseClass
             '::T::Boolean'
           else
             "::#{type.name}"
           end
    if base == '::T.untyped'
      base
    elsif base == '::NilClass'
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
end
