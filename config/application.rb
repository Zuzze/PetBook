require_relative 'boot'

require 'rails/all'
#config.assets.initialize_on_precompile = false
#config.assets.precompile = config.assets.precompile + %w(*.png *.jpg *.jpeg *.gif *.woff *.ttf *.svg *.eot)

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module PetBookApp
  class Application < Rails::Application
  	config.assets.initialize_on_precompile = true
  	config.assets.paths << Rails.root.join("app", "assets", "fonts")
  	config.assets.precompile = config.assets.precompile + %w( *.png *.jpg *.jpeg *.gif *.woff *.ttf *.svg *.eot)

  	# Include the authenticity token in remote forms.
    config.action_view.embed_authenticity_token_in_remote_forms = true
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
