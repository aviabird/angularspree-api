source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '5.1.4'
# Use SCSS for stylesheets
gem 'sass-rails', '5.0.7'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '4.1.8'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '4.2.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails', '4.3.1'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks', '5.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 1.0.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# Locking i18n gem version
gem 'i18n', '~> 0.9.5'

gem 'spree', '~> 3.4.4'
gem 'spree_auth_devise', '~> 3.3'
gem 'spree_gateway', '~> 3.3'
gem 'active_model_serializers'
gem 'httpclient'
gem 'dotenv-rails'


# Spree Extensions
gem 'spree_favorite_products', github: 'vinsol-spree-contrib/spree_favorite_products'
gem 'spree_admin_roles_and_access', github: 'vinsol-spree-contrib/spree_admin_roles_and_access'
gem 'spree_digital_assets' , github: 'vinsol-spree-contrib/spree_digital_assets'
gem 'spree_html_invoice', git: 'https://github.com/vinsol-spree-contrib/spree-html-invoice', branch: 'master'
gem 'spree_mail_settings', github: 'spree-contrib/spree_mail_settings'
gem 'spree_editor', github: 'spree-contrib/spree_editor'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'

  gem 'rubocop'
  gem 'rubycritic'
end

group :production do
  gem 'rails_12factor'
end

# DB
gem 'pg', '~> 0.18'

# Rack Cores
gem 'rack-cors', :require => 'rack/cors'

# reference https://gist.github.com/JagdeepSingh/4b03cbeab16cc0bc729bbc6d275402d3
gem 'rmagick'
