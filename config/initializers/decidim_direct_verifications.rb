# frozen_string_literal: true

if defined?(Decidim::DirectVerifications)
  Decidim::DirectVerifications.configure do |config|
    config.input_parser = :metadata_parser
  end
end
