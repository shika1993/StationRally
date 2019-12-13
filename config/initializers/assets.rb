# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path
Rails.application.config.assets.paths << Rails.root.join('vendor', 'javascripts')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'stylesheets')
Rails.application.config.assets.paths << Rails.root.join('vendor', 'fonts')
Rails.application.config.assets.paths << Rails.root.join('vendor/assets/lightbox', 'css')
Rails.application.config.assets.paths << Rails.root.join('vendor/assets/lightbox', 'images')
Rails.application.config.assets.paths << Rails.root.join('vendor/assets/lightbox', 'js')

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( index.js )
Rails.application.config.assets.precompile += %w( image.js )
Rails.application.config.assets.precompile += %w( edit.js )
Rails.application.config.assets.precompile += %w( new.js )
Rails.application.config.assets.precompile += %w( E-mail_error.js )
Rails.application.config.assets.precompile += %w( registration.js )
Rails.application.config.assets.precompile += %w( lightbox.js )
Rails.application.config.assets.precompile += %w( lightbox.min.js )
Rails.application.config.assets.precompile += %w(*.eot *.woff *.woff2 *.ttf *.svg *.otf *.png *.jpg *.gif )
Rails.application.config.assets.precompile += %w( choice.js )
Rails.application.config.assets.precompile += %w( omedetou.js )