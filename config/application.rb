require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Wtbp
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de

    config.before_configuration do
      if Rails.env == 'development' do
        env_file = File.join(Rails.root, 'config', 'social_keys.yml')
        file_content = YAML::load(IO.read(env_file)).split("\"")
        
        n_pairs = file_content.length / 2
        
        n_pairs.times.with_index do |i|
          i *= 2
          key = file_content[0+i][0..-2]
          value = file_content[1+i]
          ENV[key] = value
        end

        # CONFIG = HashWithIndifferentAccess.new(file_content)
        # CONFIG.each do |key, value|
        #   ENV[key.to_s] = value
        # end
      end
    end



    
  end
end
