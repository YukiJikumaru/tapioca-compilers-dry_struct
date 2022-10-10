# frozen_string_literal: true



require "rspec/core/rake_task"

RSpec::Core::RakeTask.new(:spec)

task default: :spec

desc 'Exec "bundle exec tapioca dsl"'
task :dsl do
  exec('bundle exec tapioca dsl')
end