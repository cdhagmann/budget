source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"
gem "rails"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"


gem "dotenv-rails"
gem "pg"
gem "puma"


group :development, :test do
  gem "awesome_print"
  gem "binding_of_caller"
  gem "brakeman", require: false
  gem "bundler-audit", require: false
  gem "bunny-mock", "~> 1.7"
  gem "dry-cli"
  gem "fabrication", "~> 2.22"
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "pry-byebug", platform: :mri
  gem "rspec-rails"
  gem "rubocop-performance", "~> 1.9.0"
  gem "rubocop-rails", "~> 2.9.1", require: false
  gem "rubocop-rspec", "~> 2.0.0", require: false
  gem "rubocop", "~> 1.25.0"
  gem "ruby-prof", "~> 1.0"
  gem "simplecov", require: false
  gem "tty"
  gem "webmock"
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
end

group :development do
  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]
