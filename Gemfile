source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  # gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
# gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'rubocop', require: false
gem 'rubycritic', require: false

gem 'i18n', '~> 0.9.5'

gem 'pg', '~> 0.18'

gem 'active_model_serializers'
gem 'dotenv-rails'
gem 'httpclient'
gem 'spree', '~> 3.6.0'
gem 'spree_auth_devise', github: 'spree/spree_auth_devise', branch: 'master'
gem 'spree_gateway', '~> 3.3'

# Spree Extensions
gem 'spree_admin_roles_and_access', github: 'vinsol-spree-contrib/spree_admin_roles_and_access'
# gem 'spree_digital_assets', github: 'vinsol-spree-contrib/spree_digital_assets'
gem 'spree_editor', github: 'spree-contrib/spree_editor'
gem 'spree_favorite_products', github: 'vinsol-spree-contrib/spree_favorite_products'
gem 'spree_html_invoice', github: 'vinsol-spree-contrib/spree-html-invoice', branch: 'master'
gem 'spree_mail_settings', github: 'spree-contrib/spree_mail_settings'
gem 'spree_recently_viewed', github: 'spree-contrib/spree_recently_viewed'
gem 'spree_related_products', github: 'spree-contrib/spree_related_products'
gem 'spree_reviews', github: 'spree-contrib/spree_reviews'
gem 'spree_events_tracker', github: 'vinsol-spree-contrib/spree_events_tracker', branch: 'master'
gem 'spree_admin_insights', git: 'https://github.com/vinsol-spree-contrib/spree-admin-insights', branch: 'master'
gem 'spree_analytics_trackers', github: 'spree-contrib/spree_analytics_trackers'

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

group :production do
  gem 'rails_12factor'
end

# Rack Cores
gem 'rack-cors', require: 'rack/cors'

# reference https://gist.github.com/JagdeepSingh/4b03cbeab16cc0bc729bbc6d275402d3
gem 'oj'


gem "aws-sdk-s3", require: false

gem 'cloudinary', require: false
gem 'activestorage-cloudinary-service'

gem 'activerecord-import'