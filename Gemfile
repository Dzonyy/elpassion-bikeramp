source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.0.2'


gem 'bootsnap', '>= 1.4.4', require: false
gem 'callee'
gem 'draper'
gem 'dry-monads'
gem 'geocoder', '~> 1.3'
gem 'money-rails', '~> 1.12'
gem 'pg', '~> 1.1'
gem 'puma', '~> 5.0'
gem 'rack-cors'
gem 'rails', '~> 6.1.4', '>= 6.1.4.1'
gem 'redis', '~> 4.0'

group :development, :test do
  gem 'pry'
  gem 'factory_bot_rails', '~> 6.1.0'
  gem 'rspec-rails', '~> 4.0.1'
  gem 'rubocop', '~> 1.3.1'
end

group :development do
  gem 'annotate'
  gem 'listen', '~> 3.3'
  gem 'spring'
  gem 'rubocop-rspec', '~> 2.0.0', require: false
end

group :test do
  gem 'simplecov', '0.17.1'
  gem 'webmock', '~> 3.11.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
