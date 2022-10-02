require 'dry-types'
require 'dry-struct'

class ExampleBuiltin < ::Dry::Struct
  module Types
    include ::Dry.Types()
  end

  Dry::Types.load_extensions(:maybe)
  Dry::Types.load_extensions(:monads)

  attribute :builtin01,  Types::Nominal::Any
  attribute :builtin02,  Types::Nominal::Nil
  attribute :builtin03,  Types::Nominal::Symbol
  attribute :builtin04,  Types::Nominal::Class
  attribute :builtin05,  Types::Nominal::True
  attribute :builtin06,  Types::Nominal::False
  attribute :builtin07,  Types::Nominal::Bool
  attribute :builtin08,  Types::Nominal::Integer
  attribute :builtin09,  Types::Nominal::Float
  attribute :builtin10, Types::Nominal::Decimal
  attribute :builtin11, Types::Nominal::String
  attribute :builtin12, Types::Nominal::Date
  attribute :builtin13, Types::Nominal::DateTime
  attribute :builtin14, Types::Nominal::Time
  attribute :builtin15, Types::Nominal::Array
  attribute :builtin16, Types::Nominal::Hash

  attribute :builtin17, Types::Strict::Nil
  attribute :builtin18, Types::Strict::Symbol
  attribute :builtin19, Types::Strict::Class
  attribute :builtin20, Types::Strict::True
  attribute :builtin21, Types::Strict::False
  attribute :builtin22, Types::Strict::Bool
  attribute :builtin23, Types::Strict::Integer
  attribute :builtin24, Types::Strict::Float
  attribute :builtin25, Types::Strict::Decimal
  attribute :builtin26, Types::Strict::String
  attribute :builtin27, Types::Strict::Date
  attribute :builtin28, Types::Strict::DateTime
  attribute :builtin29, Types::Strict::Time
  attribute :builtin30, Types::Strict::Array
  attribute :builtin31, Types::Strict::Hash

  attribute :builtin32, Types::Coercible::String
  attribute :builtin33, Types::Coercible::Symbol
  attribute :builtin34, Types::Coercible::Integer
  attribute :builtin35, Types::Coercible::Float
  attribute :builtin36, Types::Coercible::Decimal
  attribute :builtin37, Types::Coercible::Array
  attribute :builtin38, Types::Coercible::Hash

  attribute :builtin39, Types::Params::Nil
  attribute :builtin40, Types::Params::Date
  attribute :builtin41, Types::Params::DateTime
  attribute :builtin42, Types::Params::Time
  attribute :builtin43, Types::Params::True
  attribute :builtin44, Types::Params::False
  attribute :builtin45, Types::Params::Bool
  attribute :builtin46, Types::Params::Integer
  attribute :builtin47, Types::Params::Float
  attribute :builtin48, Types::Params::Decimal
  attribute :builtin49, Types::Params::Array
  attribute :builtin50, Types::Params::Hash

  attribute :builtin51, Types::JSON::Nil
  attribute :builtin52, Types::JSON::Symbol
  attribute :builtin53, Types::JSON::Date
  attribute :builtin54, Types::JSON::DateTime
  attribute :builtin55, Types::JSON::Time
  attribute :builtin56, Types::JSON::Decimal
  attribute :builtin57, Types::JSON::Array
  attribute :builtin58, Types::JSON::Hash

  attribute :builtin59, Types::Maybe::Strict::Class
  attribute :builtin60, Types::Maybe::Strict::String
  attribute :builtin61, Types::Maybe::Strict::Symbol
  attribute :builtin62, Types::Maybe::Strict::True
  attribute :builtin63, Types::Maybe::Strict::False
  attribute :builtin64, Types::Maybe::Strict::Integer
  attribute :builtin65, Types::Maybe::Strict::Float
  attribute :builtin66, Types::Maybe::Strict::Decimal
  attribute :builtin67, Types::Maybe::Strict::Date
  attribute :builtin68, Types::Maybe::Strict::DateTime
  attribute :builtin69, Types::Maybe::Strict::Time
  attribute :builtin70, Types::Maybe::Strict::Array
  attribute :builtin71, Types::Maybe::Strict::Hash

  attribute :builtin72, Types::Maybe::Coercible::String
  attribute :builtin73, Types::Maybe::Coercible::Integer
  attribute :builtin74, Types::Maybe::Coercible::Float
  attribute :builtin75, Types::Maybe::Coercible::Decimal
  attribute :builtin76, Types::Maybe::Coercible::Array
  attribute :builtin77, Types::Maybe::Coercible::Hash
end
