# tapioca-compilers-dry_struct

[![Gem Version](https://badge.fury.io/rb/tapioca-compilers-dry_struct.svg)](https://badge.fury.io/rb/tapioca-compilers-dry_struct) ![github action badge](https://github.com/YukiJikumaru/tapioca-compilers-dry_struct/actions/workflows/main.yml/badge.svg)

**[WARNING] THIS APP IS ALPHA VERSION!!!**

This script is a [Tapioca's custom DSL compiler](https://github.com/Shopify/tapioca#writing-custom-dsl-compilers) for [dry-struct](https://dry-rb.org/gems/dry-struct/main/).

From this ruby code,

```
class Example < Dry::Struct
  attribute  :attr01, Types::String
  attribute  :attr02, Types::String.optional
  attribute? :attr03, Types::String
  attribute  :attr04, Types::Integer
  attribute  :attr05, Types::Date
  attribute  :attr06, Types::Array.of(Types::String)
  attribute  :attr07, Types.Constructor(User)
  attribute  :attr08, Types::String | Types::Integer
  attribute  :attr09, Types::Maybe::String
end
```

the compiler generates a rbi file below.

```
class Example
  sig { returns(String) }
  def attr01; end

  sig { returns(T.nilable(String)) }
  def attr02; end

  sig { returns(T.nilable(String)) }
  def attr03; end

  sig { returns(Integer) }
  def attr04; end

  sig { returns(Date) }
  def attr05; end

  sig { returns(T::Array[String]) }
  def attr06; end

  sig { returns(User) }
  def attr07; end

  sig { returns(T.any(String, Integer)) }
  def attr08; end

  sig { returns(T.any(Dry::Monads::Maybe::Some, Dry::Monads::Maybe::None)) }
  def attr09; end
end
```

# Installation

Add this line to your application’s Gemfile:

```
gem 'tapioca-compilers-dry_struct'
```

And then execute:

```
$ bundle
```

> all the gem needs to do is to place the DSL compiler inside the lib/tapioca/dsl/compilers folder and it will be automatically discovered and loaded by Tapioca.
>
> https://github.com/Shopify/tapioca/blob/v0.10.2/README.md#writing-custom-dsl-compilers

Tapioca automatically load the compiler inside gem, just you need to do is type a command below.

```
$ bundle exec tapioca dsl
```

# Development

Execute `./bin/dsl` generates rbi files under `sorbet/rbi/dsl/`.
If you need to test another dry-struct, add or edit rb files under `spec/examples/` and generate rbi files.

A compiler itself exists in `lib/tapioca/dsl/compilers/dry_struct.rb`.

# Test

```
bundle exec rake spec
```

# Environment Variables

You can change behaviours of the compiler by environment variables.

## DRY_PREFER_PLAIN_TIME

\ | Ruby `Time` is typed as
------- | --------
0 (DEFAULT) | `::ActiveSupport::TimeWithZone`
1 | `::Time`

## DRY_USE_EXPERIMENTAL_SHAPE

\ | `Types::Hash.schema(name: Types::String, age: Types::Integer)` is typed as
------- | --------
0 (DEFAULT) | `::T::Hash[::T.untyped, ::T.untyped]`
1 | `{ name: ::String, age: ::Integer }`

# References

https://discourse.dry-rb.org/t/dry-rb-sorbet-can-we-unite/961

https://github.com/Shopify/tapioca/issues/1210
