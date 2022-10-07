# typed: ignore
# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

class ExampleMaybe < ::Dry::Struct
  Dry::Types.load_extensions(:maybe)

  module Types
    include ::Dry.Types()
  end

  attribute  :maybe01, Types::Maybe::Strict::Class
  attribute  :maybe02, Types::Maybe::Strict::String
  attribute  :maybe03, Types::Maybe::Strict::Symbol
  attribute  :maybe04, Types::Maybe::Strict::True
  attribute  :maybe05, Types::Maybe::Strict::False
  attribute  :maybe06, Types::Maybe::Strict::Integer
  attribute  :maybe07, Types::Maybe::Strict::Float
  attribute  :maybe08, Types::Maybe::Strict::Decimal
  attribute  :maybe09, Types::Maybe::Strict::Date
  attribute  :maybe10, Types::Maybe::Strict::DateTime
  attribute  :maybe11, Types::Maybe::Strict::Time
  attribute  :maybe12, Types::Maybe::Strict::Array
  attribute  :maybe13, Types::Maybe::Strict::Hash

  attribute  :maybe14, Types::Maybe::Coercible::String
  attribute  :maybe15, Types::Maybe::Coercible::Integer
  attribute  :maybe16, Types::Maybe::Coercible::Float
  attribute  :maybe17, Types::Maybe::Coercible::Decimal
  attribute  :maybe18, Types::Maybe::Coercible::Array
  attribute  :maybe19, Types::Maybe::Coercible::Hash

  attribute? :maybe20, Types::Maybe::Strict::Class
  attribute? :maybe21, Types::Maybe::Strict::String
  attribute? :maybe22, Types::Maybe::Strict::Symbol
  attribute? :maybe23, Types::Maybe::Strict::True
  attribute? :maybe24, Types::Maybe::Strict::False
  attribute? :maybe25, Types::Maybe::Strict::Integer
  attribute? :maybe26, Types::Maybe::Strict::Float
  attribute? :maybe27, Types::Maybe::Strict::Decimal
  attribute? :maybe28, Types::Maybe::Strict::Date
  attribute? :maybe29, Types::Maybe::Strict::DateTime
  attribute? :maybe30, Types::Maybe::Strict::Time
  attribute? :maybe31, Types::Maybe::Strict::Array
  attribute? :maybe32, Types::Maybe::Strict::Hash

  attribute? :maybe33, Types::Maybe::Coercible::String
  attribute? :maybe34, Types::Maybe::Coercible::Integer
  attribute? :maybe35, Types::Maybe::Coercible::Float
  attribute? :maybe36, Types::Maybe::Coercible::Decimal
  attribute? :maybe37, Types::Maybe::Coercible::Array
  attribute? :maybe38, Types::Maybe::Coercible::Hash
end
