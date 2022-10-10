**[WARNING] THIS APP IS ALPHA VERSION!!!**

This script is a [Tapioca's custom DSL compiler](https://github.com/Shopify/tapioca#writing-custom-dsl-compilers) for [dry-struct](https://dry-rb.org/gems/dry-struct/main/).

# References

https://discourse.dry-rb.org/t/dry-rb-sorbet-can-we-unite/961

https://github.com/Shopify/tapioca/issues/1210

# Installation

```
cp sorbet/tapioca/compilers/dry_types.rb PATH_TO_YOUR_PROJECT/sorbet/tapioca/compilers/dry_types.rb

cd PATH_TO_YOUR_PROJECT

bundle exec rake dsl

  OR

DRY_PREFER_PLAIN_TIME=0 DRY_USE_EXPERIMENTAL_SHAPE=1 bundle exec rake dsl
```

# Development

Add rb files under `spec/examples/` and execute `bundle exec rake dsl` generates rbi files under `sorbet/rbi/dsl/`.

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
