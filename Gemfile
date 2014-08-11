source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.1.4'
gem 'pg'
gem 'unicorn-rails'

gem 'faraday'
gem 'faraday_middleware'

gem 'pry-rails'

gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'

group :test do
  gem 'rspec-rails'
  gem 'webmock'
end

group :development do
  gem 'spring'
  gem 'quiet_assets'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
end

group :development, :test do
  gem 'dotenv-rails'
end

gem 'rails_12factor', group: :production
