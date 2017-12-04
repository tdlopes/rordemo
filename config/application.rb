require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Rordemo
  class CustomFormat < ::Logger::Formatter
    # This method is invoked when a log event occurs
    def call(severity, timestamp, progname, msg)
      "[#{severity[0]}] [#{timestamp}] #{String === msg ? msg : msg.inspect}\n"
    end
  end

  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    logger = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = CustomFormat.new
    config.logger = ActiveSupport::TaggedLogging.new(logger)
    config.active_record.logger = nil

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
