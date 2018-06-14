gem install bundler
bundle
rake db:reset
rake spree_sample:load
bundle exec rake spree_roles:permissions:populate
bundle exec rake spree_roles:permissions:populate_permission_sets
rails s
