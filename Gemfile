source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '~> 4.1'
gem 'pg'

gem 'faraday'
gem 'faraday_middleware'

gem 'pry-rails'

gem 'bootstrap-sass', '~> 3.2'
gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 1.3'

gem 'octokit', '~> 3.0'

group :test do
  gem 'rspec-rails'
  gem 'webmock'
  gem 'vcr'
  gem 'factory_girl_rails'
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
  gem 'foreman', require: false
end

group :development, :test do
  gem 'dotenv-rails'
end

group :production do
  gem 'unicorn-rails'
  gem 'rails_12factor'
end
