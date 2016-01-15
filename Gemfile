source 'https://rubygems.org'

ruby '2.3.0'

gem 'rails', '~> 4.2'
gem 'pg'

gem 'faraday'
gem 'faraday_middleware'

gem 'pry-rails'

gem 'bootstrap-sass', '~> 3.2'
gem 'sass-rails', '~> 4.0'
gem 'uglifier', '>= 2.7.2'

gem 'octokit', '~> 3.0'

gem 'newrelic_rpm'

gem 'devise'
gem 'omniauth-google-oauth2'

gem 'honeybadger', '~> 2.0'

group :test do
  gem 'webmock'
  gem 'vcr'
  gem 'factory_girl_rails'
  gem 'timecop'
  gem 'capybara'
end

group :development do
  # Commenting out until https://github.com/rails/spring/issues/456 is resolved
  # gem 'spring'
  gem 'quiet_assets'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'rb-fchange', require: false
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
  gem 'foreman', require: false
  gem 'web-console', '~> 2.0'
  gem 'pry-byebug'
end

group :development, :test do
  gem 'dotenv-rails'
  gem 'guard-rspec'
  gem 'rspec-rails'
end

group :production do
  gem 'unicorn-rails'
  gem 'rails_12factor'
end
