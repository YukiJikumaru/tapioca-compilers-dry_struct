# typed: false
# frozen_string_literal: true
require 'spec_helper'

describe 'Tapioca::Compilers::DryStruct' do
  before(:each) do
    suppress_output { create_dsl_command(requested_constants).execute }
  end
  after(:each) do
    FileUtils.rm_rf(::Pathname.new(TEMP_DIR), secure: true)
  end
  let(:requested_constants) { [] }
  it 'generates rbi files and they are identical to test data' do
    expect(generated_rbi_paths).to match_array(%w[
      tmp/sorbet/rbi/dsl/example_array.rbi
      tmp/sorbet/rbi/dsl/example_array/inner_klass.rbi
      tmp/sorbet/rbi/dsl/example_builtin.rbi
      tmp/sorbet/rbi/dsl/example_hash.rbi
      tmp/sorbet/rbi/dsl/example_maybe.rbi
      tmp/sorbet/rbi/dsl/example_optional.rbi
      tmp/sorbet/rbi/dsl/example_others.rbi
      tmp/sorbet/rbi/dsl/example_others/inner_klass.rbi
      tmp/sorbet/rbi/dsl/example_sum.rbi
      tmp/sorbet/rbi/dsl/example_sum/inner_klass.rbi
      tmp/sorbet/rbi/dsl/example_test.rbi
    ])

    generated_rbi_paths.each do |generated_rbi_path|
      expect(FileUtils.compare_file(generated_rbi_path, to_test_data_path(generated_rbi_path))).to eq true
    end
  end
end
