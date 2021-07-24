require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "active_support/core_ext/integer/time"

module Tmp
  class Application < Rails::Application
    config.load_defaults 6.1
    config.api_only = true
  end
end
