# typed: ignore
# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

class ExampleSum < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  class InnerKlass < ::Dry::Struct
    attribute :string, Types::String
  end

  attribute  :sum01, Types::String | Types::Integer
  attribute? :sum02, Types::String | Types::Integer
  attribute  :sum03, Types::Any | Types::String | Types::Integer
  attribute? :sum04, Types::Any | Types::String | Types::Integer
  attribute  :sum05, Types::Nil | Types::String | Types::Integer
  attribute? :sum06, Types::Nil | Types::String | Types::Integer
  attribute  :sum07, Types::Any | Types::Nil | Types::String | Types::Integer
  attribute? :sum08, Types::Any | Types::Nil | Types::String | Types::Integer
  attribute  :sum09, Types.Constructor(InnerKlass) | InnerKlass
  attribute? :sum10, Types.Constructor(InnerKlass) | InnerKlass
  attribute  :sum11, Types::String | Types::String.optional
  attribute? :sum12, Types::String | Types::String.optional
end
