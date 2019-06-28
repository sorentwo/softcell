require File.expand_path('../boot', __FILE__)

require 'rails'
require 'active_record/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# If you have a Gemfile, require the gems listed there, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(:default, Rails.env) if defined?(Bundler)

module Softcell
  class Application < Rails::Application
    config.time_zone = 'Central Time (US & Canada)'

    config.assets.enabled = true
    config.assets.initialize_on_precompile = false

    config.encoding = 'utf-8'
  end
end
