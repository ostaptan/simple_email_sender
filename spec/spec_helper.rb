require 'capybara'
require 'capybara/dsl'
Capybara.default_driver = :selenium

ENV['RACK_ENV'] = 'test'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = :random
end

def fill_email_form(email, password, recipients, subject, body)
  visit 'http://localhost:4567/'
  fill_in 'email', with: email
  fill_in 'password', with: password
  fill_in 'recipients', with: recipients
  fill_in 'subject', with: subject
  fill_in 'body', with: body
end

def selector string
  find :css, string
end
