require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BrimServer
  class Application < Rails::Application
    # config.middleware.insert_before 0, Rack::Cors do
    #   allow do
    #     origins '*'
    #     resource '*', :headers => :any, :methods => [:get, :post, :options, :delete, :put, :patch], credentials: true
    #   end
    # end
    config.action_dispatch.default_headers = {
        'Access-Control-Allow-Origin' => 'http://localhost:8000',
        'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
      }

  config.assets.paths << Rails.root.join("node_modules")
  config.assets.paths << Rails.root.join("app", "assets")
  config.assets.paths << Rails.root.join("app","assets", "bower_components")
  config.assets.paths << Rails.root.join("app","assets", "stylesheets")
  config.assets.paths << Rails.root.join("assets","bower_components","bootstrap-sass-official", "assets", "stylesheets")
  config.assets.paths << Rails.root.join("assets","bower_components","bootstrap-sass-official", "assets","fonts")

  config.middleware.insert_before 0, Rack::Cors do
     allow do
       origins '*'
       resource '*', :headers => :any, :methods => [:get, :post, :options]
     end
   end

    config.middleware.insert_after(ActionDispatch::Callbacks, ActionDispatch::Cookies)
    config.middleware.insert_after(ActionDispatch::Cookies, ActionDispatch::Session::CookieStore)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
  end
end
