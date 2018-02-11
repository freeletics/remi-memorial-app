source 'https://rubygems.org'

ruby '2.5.0'

gem 'rails', '~> 5.2.0.rc1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'autoprefixer-rails'
gem 'kaminari', '>= 1.0.0'
gem 'jquery-rails'
gem 'cloudinary'

# Use ActiveStorage variant
gem 'mini_magick', '~> 4.8'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

gem 'omniauth', '~> 1.6.1'
gem 'omniauth-auth0', '~> 2.0.0'

gem 'aws-sdk-s3', require: false

group :development, :test do
  gem 'dotenv-rails', require: 'dotenv/rails-now'
end

group :development do
  gem 'scss_lint', require: false
  gem 'spring'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end
