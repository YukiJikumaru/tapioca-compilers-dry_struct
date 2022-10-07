# frozen_string_literal: true
require 'dry-types'
require 'dry-struct'

class ExampleTest < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  attribute  :enum01, Types::String.enum('draft', 'published', 'archived')
  attribute  :enum02, Types::String.default('red').enum('blue', 'green', 'red')
  attribute  :enum03, Types::String.enum('locked' => 0, 'open' => 1)
  attribute  :enum04, Types::Integer.enum(0, 1, 2)
  attribute  :enum05, Types::Integer.default(0).enum(0, 1, 2)
  attribute  :enum06, Types::Integer.enum(0 => 'zero', 1 => 'one')
  attribute? :enum07, Types::String.enum('draft', 'published', 'archived')
  attribute? :enum08, Types::String.default('red').enum('blue', 'green', 'red')
  attribute? :enum09, Types::String.enum('locked' => 0, 'open' => 1)
  attribute? :enum10, Types::Integer.enum(0, 1, 2)
  attribute? :enum11, Types::Integer.default(0).enum(0, 1, 2)
  attribute? :enum12, Types::Integer.enum(0 => 'zero', 1 => 'one')
end
