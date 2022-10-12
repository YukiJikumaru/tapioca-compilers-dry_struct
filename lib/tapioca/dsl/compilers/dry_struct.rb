# typed: true
# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'
begin
  require 'dry-monads'
rescue LoadError
  # NOP
end

module Tapioca
  module Compilers
    # tapioca's [custom DSL compilers](https://github.com/Shopify/tapioca/blob/main/README.md#writing-custom-dsl-compilers)
    # for [dry-struct](https://dry-rb.org/gems/dry-struct/).
    class DryStruct < Tapioca::Dsl::Compiler
      extend T::Sig

      VERSION = '0.0.0'

      # Convert Dry AST to type informations
      #
      # @example
      # ```
      # compiler = DryAstCompiler.new
      # DryStructClass.schema.each do |s|
      #   attribute_info = compiler.visit(s.to_ast)
      #
      #   # => { name: 'attr_name01', required: true, type: String }
      #   # => { name: 'attr_name02', required: true, type: Integer }
      #   # => { name: 'attr_name03', required: true, type: [String] }
      #   # => { name: 'attr_name04', required: true, type: [[String]] }
      #   # => { name: 'attr_name05', required: true, type: Hash }
      #   # => { name: 'attr_name06', required: true, type: Date }
      #   # => { name: 'attr_name07', required: true, type: DateTime }
      #   # => { name: 'attr_name08', required: true, type: Time }
      #   # => { name: 'attr_name09', required: true, type: Set }
      #   # => { name: 'attr_name10', required: true, type: Range }
      #   # => { name: 'attr_name11', required: true, type: YourKlass }
      #   # => { name: 'attr_name12', required: true, type: #<DryAstCompiler::Undefined> }
      #   # => { name: 'attr_name13', required: true, type: #<DryAstCompiler::Sum> }
      #   # => { name: 'attr_name14', required: true, type: #<DryAstCompiler::Map> }
      #   # => { name: 'attr_name15', required: true, type: #<DryAstCompiler::Schema> }
      # do
      # ```
      class DryAstCompiler
        # Represents dry's any type
        class Undefined

          def to_s
            'Undefined'
          end

          def inspect
            to_s
          end
        end

        # Represents dry's sum type
        class Sum
          attr_reader :types

          def initialize
            @types = ::Set.new
          end

          def size
            @types.size
          end

          def <<(arg)
            if arg.is_a?(Sum)
              arg.types.each { |t| @types << t }
            else
              @types << arg
            end
          end

          def map(&block)
            @types.map(&block)
          end

          def first
            @types.first
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

        # Represents dry's schema type
        class Schema
          def initialize(attribute_infos)
            @attribute_infos = attribute_infos
          end

          def map(&block)
            @attribute_infos.map(&block)
          end

          def empty?
            @attribute_infos.empty?
          end
        end

        # Represents dry's map type
        class Map
          attr_reader :key, :value

          def initialize(key, value)
            @key = key
            @value = value
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

        def visit_and(node)
          # NOP
        end

        def visit_array(node)
          type = visit(node[0])
          [type]
        end

        def visit_constrained(node)
          types = node.map { |r| visit(r) }.reject(&:nil?)
          types.size == 1 ? types[0] : types
        end

        def visit_nominal(node)
          type, _option = node
          type
        end

        def visit_predicate(_node)
          # NOP
        end

        def visit_schema(node)
          Schema.new(node[0].map { |n| visit(n) })
        end

        def visit_hash(_node)
          ::Hash
        end

        def visit_map(node)
          Map.new(visit(node[0]), visit(node[1]))
        end

        def visit_enum(node)
          visit(node[0][1][0])
        end

        def visit_any(_node)
          Undefined.new
        end
      end

      ConstantType = type_member {{ fixed: ::T.class_of(::Dry::Struct) }}

      sig { override.void }
      def decorate
        compiler = DryAstCompiler.new
        root.create_path(constant) do |klass|
          constant.schema.each do |s|
            attribute_info = compiler.visit(s.to_ast)
            if ::Dry::Types.const_defined?(:Maybe) && s.type.class == ::Dry::Types::Maybe
              sorbet_type = '::T.any(::Dry::Monads::Maybe::Some, ::Dry::Monads::Maybe::None)'
            else
              sorbet_type = self.class.to_sorbet_type(attribute_info[:type], attribute_info[:required])
            end
            klass.create_method(
              attribute_info[:name].to_s,
              return_type: sorbet_type,
            )
          end
        end
      end

      sig { override.returns(::T::Enumerable[Module]) }
      def self.gather_constants
        all_classes.select { |c| c < ::Dry::Struct }
      end

      sig { params(type: T.untyped, required: T::Boolean).returns(String) }
      def self.to_sorbet_type(type, required)
        base = if type.is_a?(DryAstCompiler::Sum)
                 sum_to_sorbet_type(type)
               elsif type.is_a?(DryAstCompiler::Schema)
                 env('DRY_USE_EXPERIMENTAL_SHAPE') ? experimental_schema_to_sorbet_type(type) : '::T::Hash[::T.untyped, ::T.untyped]'
               elsif type.is_a?(DryAstCompiler::Map)
                 map_to_sorbet_type(type)
               elsif type.is_a?(DryAstCompiler::Undefined)
                 '::T.untyped'
               elsif type.is_a?(::Array)
                 "::T::Array[#{to_sorbet_type(type[0], true)}]"
               elsif type == ::Hash
                 '::T::Hash[::T.untyped, ::T.untyped]'
               elsif type == ::Time
                 env('DRY_PREFER_PLAIN_TIME') ? '::Time' : '::ActiveSupport::TimeWithZone'
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

      sig { params(sum: DryAstCompiler::Sum).returns(String) }
      def self.sum_to_sorbet_type(sum)
        return '::T.untyped' if sum.include_undefined?

        if sum.include_nilclass?
          sum.delete_nilclass!
          if sum.size < 2
            "::T.nilable(#{to_sorbet_type(sum.first, true)})"
          elsif (sum.types - [::TrueClass, ::FalseClass]).empty?
            '::T.nilable(::T::Boolean)'
          else
            "::T.nilable(::T.any(#{sum.map { |t| to_sorbet_type(t, true) }.join(', ')}))"
          end
        else
          if (sum.types - [::TrueClass, ::FalseClass]).empty?
            '::T::Boolean'
          elsif sum.size == 1
            to_sorbet_type(sum.first, true)
          else
            "::T.any(#{sum.map { |t| to_sorbet_type(t, true) }.join(', ')})"
          end
        end
      end

      sig { params(map: DryAstCompiler::Map).returns(String) }
      def self.map_to_sorbet_type(map)
        "::T::Hash[#{map.key}, #{map.value}]"
      end

      sig { params(schema: DryAstCompiler::Schema).returns(String) }
      def self.experimental_schema_to_sorbet_type(schema)
        return '::T::Hash[::T.untyped, ::T.untyped]' if schema.empty?

        sigs = schema.map do |i|
          sorbet_type = to_sorbet_type(i[:type], i[:required])
          i[:name].is_a?(::String) ? "'#{i[:name]}' => #{sorbet_type}" : "#{i[:name]}: #{sorbet_type}"
        end

        "{ #{sigs.join(', ')} }"
      end

      sig { params(key: String).returns(T::Boolean) }
      def self.env(key)
        v = ENV[key]
        return false if v.nil?
        return false if v == '0'
        true
      end
    end
  end
end

