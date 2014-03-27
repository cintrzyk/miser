require File.expand_path('../boot', __FILE__)

require 'active_model/railtie'
require 'action_controller/railtie'
require 'action_view/railtie'
require 'sprockets/railtie'

# fix haml_coffee_assets https://github.com/netzpirat/haml_coffee_assets/pull/125
require 'action_view/template/resolver'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Miser
  class Application < Rails::Application
    config.time_zone = 'Warsaw'
    config.i18n.default_locale = :en
  end
end
