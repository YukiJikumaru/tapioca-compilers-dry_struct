require 'tapioca'
require 'tapioca/internal'
require 'fileutils'

TEMP_DIR = 'tmp/sorbet/rbi/dsl/'
TEST_DATA_DIR = 'spec/test_data/'

def generated_rbi_paths
  ::Dir.glob("#{TEMP_DIR}**/*.rbi")
end

def to_test_data_path(generated_rbi_path)
  generated = ::Pathname.new(generated_rbi_path)
  testdata = ::Pathname.new(TEST_DATA_DIR).join(generated.sub(TEMP_DIR, ''))
end

def create_dsl_command(requested_constants)
  rbi_formatter = ::Tapioca::DEFAULT_RBI_FORMATTER
  rbi_formatter.max_line_length = 120

  command = ::Tapioca::Commands::Dsl.new(
    requested_constants: requested_constants,
    outpath: ::Pathname.new(TEMP_DIR),
    only: [],
    exclude: [],
    file_header: true,
    tapioca_path: ::Tapioca::TAPIOCA_DIR,
    should_verify: false,
    quiet: true,
    verbose: false,
    number_of_workers: 1,
    rbi_formatter: rbi_formatter,
  )
end

def suppress_output
  original_stderr = $stderr.clone
  original_stdout = $stdout.clone
  $stderr.reopen(File.new('/dev/null', 'w'))
  $stdout.reopen(File.new('/dev/null', 'w'))
  yield
ensure
  $stdout.reopen(original_stdout)
  $stderr.reopen(original_stderr)
end
