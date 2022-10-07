require 'dry-types'
require 'dry-struct'

class ExampleHash < ::Dry::Struct
 Dry::Types.load_extensions(:maybe)
  module Types
    include ::Dry.Types()
  end

  class Klass; end

  attribute? :hash_map_01, Types::Hash.map(Types::Integer, Types::Float)
  attribute? :hash_map_02, Types::Hash.map(Types.Instance(Klass), Types::Float)
  attribute? :hash_map_03, Types::Hash.map(Types::Integer, Types.Instance(Klass))

  attribute? :hash_schema_01, Types::Hash.schema({})
  attribute? :hash_schema_02, Types::Hash.schema(name: Types::String, age: Types::Coercible::Integer)
  attribute? :hash_schema_03, Types::Hash.schema(name: Types.Instance(Klass), age: Types::Coercible::Integer)
end
