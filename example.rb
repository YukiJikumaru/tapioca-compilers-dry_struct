puts 'OKOKOKOK'
puts 'OKOKOKOK'
puts 'OKOKOKOK'
puts 'OKOKOKOK'
require 'dry-types'
require 'dry-struct'

class Example < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  Dry::Types.load_extensions(:maybe)
  Dry::Types.load_extensions(:monads)

  class Fooo < ::Dry::Struct
    attribute :string, Types::String
  end

  attribute  :string1, Types::String
  attribute  :string2, Types::String.optional
  attribute? :string3, Types::String
  attribute? :string4, Types::String.optional
  attribute  :string5, Types::String.default('DEF'.freeze)
  attribute  :string6, Types::Nil | Types::String

  attribute  :integer1, Types::Integer
  attribute  :integer2, Types::Coercible::Integer
  attribute  :integer3, Types::Params::Integer

  attribute  :date1, Types::Date
  attribute  :date2, Types::Params::Date

  attribute  :datetime1, Types::DateTime
  attribute  :datetime2, Types::Params::DateTime

  attribute  :time1, Types::Time
  attribute  :time2, Types::Params::Time

  attribute? :klass1, Fooo

  attribute? :constructor1, Types.Constructor(Fooo)

  attribute? :hash1, Types::Hash.schema(name: Types::String, age: Types::Coercible::Integer)

  attribute? :interface1, Types.Interface(:call).optional

  attribute? :instance1, Types.Instance(Range)

  attribute  :sum1, Types::Nil | Types::String | Types::Integer
  attribute  :sum2, Types::Nil | Types.Array(Types::String) | Types.Array(Types::Integer)

  attribute  :array1, Types.Array(Types::String)
  attribute? :array2, Types.Array(Types::String)
  attribute  :array3, Types.Array(Fooo)
end
