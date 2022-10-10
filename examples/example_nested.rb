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
end
