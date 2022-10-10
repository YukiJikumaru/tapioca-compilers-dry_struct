# typed: ignore
# frozen_string_literal: true

Dir.glob('./spec/examples/**/*rb').each do |path|
  require path
end
