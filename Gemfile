source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.4'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.6', '>= 6.1.6.1'
# Use mysql as the database for Active Record
gem 'mysql2', '~> 0.5'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Responsive framework for entity views
gem 'trestle', '~> 0.9'
# Jira API library
gem 'jira-ruby', :require => 'jira-ruby'
# HTTP connector libraries
gem 'faraday', '~> 2.5', '>= 2.5.2'
gem 'faraday-httpclient', '~> 2.0', '>= 2.0.1'
gem 'faraday-retry'
# Enables diagnostic logging of HTTP traffic
gem 'http_logger', '~> 0.7.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # RSpec software testing framework
  gem 'rspec-rails', '~>5.1.2'
  # Code quality check using a linter
  gem 'rubocop', '~>1.31'
  gem 'rubocop-rails', '~>2.15.1'
  gem 'rubocop-rspec', '~>2.11.1'
  gem 'rubocop-faker', '~> 1.1'
  # Keeping database clean for testing purposes
  gem 'database_cleaner', '~> 2.0', '>= 2.0.1'
  # Data generators to be used in testing
  gem 'factory_bot_rails', '~> 6.2'
  # Library for generating fake data
  gem 'faker', '~> 2.21'
  # Simplifies matching tests in RSpec
  gem 'shoulda-matchers', '~> 5.1'
  # Database seeding tool
  gem 'yaml_db', '~> 0.7.0'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
