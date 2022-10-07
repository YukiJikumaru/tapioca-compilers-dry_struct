# typed: ignore
# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

class ExampleOptional < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  attribute :builtin01, Types::Nominal::Any.optional
  attribute :builtin02, Types::Nominal::Nil.optional
  attribute :builtin03, Types::Nominal::Symbol.optional
  attribute :builtin04, Types::Nominal::Class.optional
  attribute :builtin05, Types::Nominal::True.optional
  attribute :builtin06, Types::Nominal::False.optional
  attribute :builtin07, Types::Nominal::Bool.optional
  attribute :builtin08, Types::Nominal::Integer.optional
  attribute :builtin09, Types::Nominal::Float.optional
  attribute :builtin10, Types::Nominal::Decimal.optional
  attribute :builtin11, Types::Nominal::String.optional
  attribute :builtin12, Types::Nominal::Date.optional
  attribute :builtin13, Types::Nominal::DateTime.optional
  attribute :builtin14, Types::Nominal::Time.optional
  attribute :builtin15, Types::Nominal::Array.optional
  attribute :builtin16, Types::Nominal::Hash.optional

  attribute :builtin17, Types::Strict::Nil.optional
  attribute :builtin18, Types::Strict::Symbol.optional
  attribute :builtin19, Types::Strict::Class.optional
  attribute :builtin20, Types::Strict::True.optional
  attribute :builtin21, Types::Strict::False.optional
  attribute :builtin22, Types::Strict::Bool.optional
  attribute :builtin23, Types::Strict::Integer.optional
  attribute :builtin24, Types::Strict::Float.optional
  attribute :builtin25, Types::Strict::Decimal.optional
  attribute :builtin26, Types::Strict::String.optional
  attribute :builtin27, Types::Strict::Date.optional
  attribute :builtin28, Types::Strict::DateTime.optional
  attribute :builtin29, Types::Strict::Time.optional
  attribute :builtin30, Types::Strict::Array.optional
  attribute :builtin31, Types::Strict::Hash.optional

  attribute :builtin32, Types::Coercible::String.optional
  attribute :builtin33, Types::Coercible::Symbol.optional
  attribute :builtin34, Types::Coercible::Integer.optional
  attribute :builtin35, Types::Coercible::Float.optional
  attribute :builtin36, Types::Coercible::Decimal.optional
  attribute :builtin37, Types::Coercible::Array.optional
  attribute :builtin38, Types::Coercible::Hash.optional

  attribute :builtin39, Types::Params::Nil.optional
  attribute :builtin40, Types::Params::Date.optional
  attribute :builtin41, Types::Params::DateTime.optional
  attribute :builtin42, Types::Params::Time.optional
  attribute :builtin43, Types::Params::True.optional
  attribute :builtin44, Types::Params::False.optional
  attribute :builtin45, Types::Params::Bool.optional
  attribute :builtin46, Types::Params::Integer.optional
  attribute :builtin47, Types::Params::Float.optional
  attribute :builtin48, Types::Params::Decimal.optional
  attribute :builtin49, Types::Params::Array.optional
  attribute :builtin50, Types::Params::Hash.optional

  attribute :builtin51, Types::JSON::Nil.optional
  attribute :builtin52, Types::JSON::Symbol.optional
  attribute :builtin53, Types::JSON::Date.optional
  attribute :builtin54, Types::JSON::DateTime.optional
  attribute :builtin55, Types::JSON::Time.optional
  attribute :builtin56, Types::JSON::Decimal.optional
  attribute :builtin57, Types::JSON::Array.optional
  attribute :builtin58, Types::JSON::Hash.optional
end
