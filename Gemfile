source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
# Use sqlite3 as the database for Active Record
# gem 'sqlite3', '~> 1.4'
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 4.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Kithe
gem 'kithe', '~> 1.0.0'
gem 'bootstrap', '~> 4.0'
gem 'simple_form', '~> 5.0'
gem 'cocoon', '~> 1.2'
gem 'jquery-rails', "~> 4.4"
gem "qa", "~> 5.0"

# Dotenv
gem 'dotenv-rails'

# Auth
gem 'devise'
gem 'devise-bootstrap-views', '~> 1.0'
gem 'devise_invitable', '~> 2.0.0'

gem 'sidekiq', '~> 6.0.7'

# Versioning
gem 'paper_trail'

# ActiveStorage
gem 'active_storage_validations'

# State
gem 'statesman', '~> 7.1.0'

# API
gem 'httparty'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'solr_wrapper', "~> 2.1"
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
  gem 'webdrivers'
  gem 'capybara'
  gem 'capybara-screenshot'
  gem 'm', '~> 1.5.0'
  gem 'minitest'
  gem 'minitest-ci', '~> 3.4.0'
  gem 'minitest-reporters'
  gem 'shoulda-context'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
