# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'
require 'sprockets/railtie'
require 'action_view/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    config.middleware.insert_after Rack::Runtime, Rack::MethodOverride
    config.middleware.insert_after ActionDispatch::Callbacks, ActionDispatch::Cookies
    config.middleware.insert_after ActionDispatch::Cookies, ActionDispatch::Session::CookieStore
    config.middleware.insert_after ActionDispatch::Session::CookieStore, ActionDispatch::Flash
    config.middleware.use ActionDispatch::ContentSecurityPolicy::Middleware
    config.middleware.use ActionDispatch::PermissionsPolicy::Middleware
    config.middleware.use Rack::TempfileReaper

    config.i18n.load_path += Dir[Rails.root.join('config/locales/*.{rb,yml}')]
    I18n.available_locales = [:en]
    config.i18n.default_locale = :en
  end
end
