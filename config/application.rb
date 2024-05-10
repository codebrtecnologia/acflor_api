require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module IpeApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    config.eager_load_paths << Rails.root.join("lib")

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.available_locales = %i[en pt-BR]
    # config.i18n.default_locale = 'pt-BR'

    config.time_zone = "America/Fortaleza"
    config.i18n.default_locale = :"pt-BR"
    config.i18n.available_locales = ["pt-BR"]
    I18n.enforce_available_locales = false

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.time_zone = 'America/Fortaleza'
    # config.eager_load_paths << Rails.root.join("extras")

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true

    # This also configures session_options for use below
    config.session_store :cookie_store, key: '_ipe_api_session', expire_after: 14.days

    # Required for all session management (regardless of session_store)
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use config.session_store, config.session_options
  end
end
