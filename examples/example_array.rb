
# typed: ignore
# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

class ExampleArray < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  class InnerKlass < ::Dry::Struct
    attribute :string, Types::String
  end

  attribute  :array01, Types.Array(Types::String)
  attribute? :array02, Types.Array(Types::String)
  attribute  :array03, Types.Array(Types::String.optional)
  attribute? :array04, Types.Array(Types::String.optional)

  attribute  :array05, Types.Array(InnerKlass)
  attribute? :array06, Types.Array(InnerKlass)
  attribute  :array07, Types.Array(InnerKlass.optional)
  attribute? :array08, Types.Array(InnerKlass.optional)

  attribute  :array09, Types.Array(Types.Constructor(InnerKlass))
  attribute  :array10, Types.Array(Types.Instance(InnerKlass))

  attribute  :array11, Types.Array(Types::Nil | Types::String | Types::Integer)
  attribute  :array12, Types.Array(Types.Array(Types::Nil | Types::String | Types::Integer))
  attribute  :array13, Types.Array(InnerKlass).constrained(min_size: 1)

  attribute  :array14, Types.Array(Types.Array(Types.Array(Types.Array(Types::String))))
end
