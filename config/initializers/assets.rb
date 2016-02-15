# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join("app", "assets",
                                                         "video")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets",
                                                         "images")
Rails.application.config.assets.paths << Rails.root.join("vendor", "assets",
                                                         "fonts")

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( webarch/* )
Rails.application.config.assets.precompile += %w( fontface/* )
Rails.application.config.assets.precompile += %w( ckeditor/* )
Rails.application.config.assets.precompile += %w( devise.css )
Rails.application.config.assets.precompile += %w( devise.js )
Rails.application.config.assets.precompile += %w( static_pages.css )
Rails.application.config.assets.precompile += %w( static_pages.js )
Rails.application.config.assets.precompile += %w( courses.css )
Rails.application.config.assets.precompile += %w( courses.js )
Rails.application.config.assets.precompile += %w( episodes.css )
Rails.application.config.assets.precompile += %w( episodes.js )
Rails.application.config.assets.precompile += %w( articles.css )
Rails.application.config.assets.precompile += %w( articles.js )
Rails.application.config.assets.precompile += %w( users.css )
Rails.application.config.assets.precompile += %w( users.js )
