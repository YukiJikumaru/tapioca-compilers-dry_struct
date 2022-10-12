**[WARNING] THIS APP IS ALPHA VERSION!!!**

This script is a [Tapioca's custom DSL compiler](https://github.com/Shopify/tapioca#writing-custom-dsl-compilers) for [dry-struct](https://dry-rb.org/gems/dry-struct/main/).

# References

https://discourse.dry-rb.org/t/dry-rb-sorbet-can-we-unite/961

https://github.com/Shopify/tapioca/issues/1210

# Installation

cp lib/tapioca/dsl/compilers/dry_struct.rb PATH_TO_YOUR_PROJECT/sorbet/tapioca/compilers/dry_struct.rb

-----------------------------------

Add this line to your application’s Gemfile:

```
gem 'tapioca-compilers-dry_struct'
```

And then execute:

```
$ bundle
```

>  all the gem needs to do is to place the DSL compiler inside the lib/tapioca/dsl/compilers folder and it will be automatically discovered and loaded by Tapioca.
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

## DRY_PREFER_PLAIN_TIME

\ | Ruby `Time` is typed as
------- | --------
0(DEFAULT) | `::ActiveSupport::TimeWithZone`
1 | `::Time`

## DRY_USE_EXPERIMENTAL_SHAPE

\ | `Types::Hash.schema(name: Types::String, age: Types::Integer)` is typed as
------- | --------
0(DEFAULT) | `::T::Hash[::T.untyped, ::T.untyped]`
1 | `{ name: ::String, age: ::Integer }`
