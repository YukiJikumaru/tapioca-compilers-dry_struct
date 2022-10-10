# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = "dry_tapioca_compiler"
  spec.authors       = ["Yuki Jikumaru"]
  spec.email         = ["jikumaruyuki@gmail.com"]
  spec.license       = "MIT"
  spec.version       = "0.0.0"

  spec.summary       = "Tapioca's compiler for dry-struct"
  spec.description   = spec.summary
  spec.homepage      = "https://github.com/YukiJikumaru/dry_tapioca_compiler"
  spec.files         = Dir["README.md", "CHANGELOG.md", "dry_tapioca_compiler.gemspec", "bin/setup", "sorbet/tapioca/compilers/dry_types.rb"]
  spec.bindir        = "bin"
  spec.executables   = ["setup"]
  spec.require_paths = ["lib"]

  spec.metadata["allowed_push_host"] = "https://rubygems.org"
  spec.metadata["changelog_uri"]     = "https://github.com/YukiJikumaru/dry_tapioca_compiler/blob/main/CHANGELOG.md"
  spec.metadata["source_code_uri"]   = "https://github.com/YukiJikumaru/dry_tapioca_compiler"
  spec.metadata["bug_tracker_uri"]   = "https://github.com/YukiJikumaru/dry_tapioca_compiler/issues"

  spec.required_ruby_version = ">= 2.7.0"

  # to update dependencies edit project.yml
  spec.add_runtime_dependency "tapioca", ">= 0.10"
  spec.add_runtime_dependency "dry-struct", ">= 1.2"
  spec.add_runtime_dependency "dry-monads", ">= 1.2"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end