# typed: ignore
# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

class ExampleNested < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  class Fooo < ::Dry::Struct
    attribute :string, Types::String
  end

  attribute? :instance1, Types.Instance(Fooo)
  attribute? :instance2, Types.Instance(::Range)
  attribute? :instance3, Types.Instance(::Set)

  attribute? :constructor1, Types.Constructor(Fooo)
  attribute? :constructor2, Types.Constructor(::Range)
  attribute? :constructor3, Types.Constructor(::Set)

  attribute? :interface1, Types.Interface(:call).optional

  attribute  :sum1, Types::Nil | Types::String | Types::Integer
  attribute  :sum2, Types::Nil | Types.Array(Types::String) | Types.Array(Types::Integer)

  attribute  :array1, Types.Array(Types::String)
  attribute? :array2, Types.Array(Types::String)
  attribute? :array3, Types.Array(Types::String.optional)
  attribute  :array4, Types.Array(Fooo)
  attribute  :array5, Types.Array(Types.Constructor(Fooo))
  attribute  :array6, Types.Array(Types::Nil | Types::String | Types::Integer)
  attribute  :array7, Types.Array(Types.Array(Types::Nil | Types::String | Types::Integer))
end
