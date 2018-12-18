[![Waffle.io - Columns and their card count](https://badge.waffle.io/BeccaHyland/mentor_match_api.svg?columns=all)](https://waffle.io/BeccaHyland/mentor_match_api)

# mentor_match_api


### Build Details: (draft, collect all details, to be formatted)

initial build command: `rails new mentor_match_api -T -d postgresql --skip-spring --skip-turbolinks`

Gems added:
general:
gem 'fast_jsonapi'
gem 'rack-cors', require 'rack/cors'
gem 'active-designer'

development & test
  gem 'rspec-rails'
  gem 'capybara'
  gem 'factory_bot_rails'
  gem 'pry'
  gem 'shoulda-matchers'
  gem 'launchy'
  gem 'database_cleaner'
  gem 'faker'

  test only
  gem 'simplecov'

 Run `rails g rspec:install`

 To rails_helper, added
 `Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end`
and `require 'faker'`

To spec_helper, added:
`require 'database_cleaner'`
`require 'simplecov'`
`SimpleCov.start "rails"`

within the spec_helper RSpec configure:
`config.before(:suite) do
      DatabaseCleaner.strategy = :transaction
      DatabaseCleaner.clean_with(:truncation)
    end
    config.around(:each) do |example|
        DatabaseCleaner.cleaning do
        example.run
      end
    end`

  in config/application.rb, added:
  `config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :options]
      end
    end` for the rack-cors gem

## Introduction
  This app provides the api endpoints for the Mentor Match Project.
  View the final project here:

## Initial Setup

## How to Use

  This project provides the following endpoints:

## Known Issues

## Running Tests

## How to Contribute

## Core Contributors

## Schema Design

## Tech Stack List
* Ruby 2.4.1
* Ruby on Rails 5.1
