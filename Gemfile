source 'https://rubygems.org'
ruby '2.2.2'

gem 'rails', '4.2.2'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
# gem 'jbuilder', '~> 2.0'
gem 'active_model_serializers', '0.9.3'

gem 'lodash-rails'
gem 'angularjs-rails'
gem 'angularjs-rails-resource', '~> 2.0.0'
gem 'select2-rails'
gem 'angular-ui-select-rails'

source 'https://rails-assets.org' do
  gem 'rails-assets-ngInfiniteScroll'
  gem 'rails-assets-angular-bootstrap'
  # gem 'rails-assets-BOWER_PACKAGE_NAME'
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'

  gem 'factory_girl_rails'
  gem 'faker'
  gem 'rspec-rails'
end

gem 'devise'
gem 'haml-rails'
gem 'pg'
gem 'puma'

gem 'multi_json'
# Read from SRT (subtitle) files
gem 'srt', github: 'cpetersen/srt'

# Full text search for Postgres
gem 'texticle', "2.0", :require => 'texticle/rails'

group :development do
  gem 'vlc-client'

  gem 'better_errors'
  gem 'html2haml'
  gem 'quiet_assets'
  gem 'rails_layout'
  gem 'spring-commands-rspec'

  gem 'dotenv-rails', :require => 'dotenv/rails-now'

  gem 'annotate'
  gem 'jazz_fingers'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'binding_of_caller'
  gem 'rails-erd'
  gem 'rails-footnotes', '>= 4.0.0', '<5' # then command line $rails generate rails_footnotes:install
  gem 'peek'
end

group :production do
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
