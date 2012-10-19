source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'guard'
  gem 'guard-cucumber'
end

# for Heroku deployment - as described in Ap. A of ELLS book
group :development, :test do
  gem 'rspec'
  gem 'rspec-rails'
  gem 'sqlite3'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'launchy'
end
group :test do
  gem 'cucumber-rails'
  gem 'cucumber-rails-training-wheels'
  gem 'fabrication'
end
group :production do
#  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'therubyracer'              
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

gem 'haml'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
