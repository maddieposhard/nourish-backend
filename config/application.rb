require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NourishApi
  class Application < Rails::Application
    config.load_defaults 8.0

    # Enable API-only mode
    config.api_only = true
end

end
