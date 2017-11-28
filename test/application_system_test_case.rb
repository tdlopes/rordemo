require 'test_helper'
require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :poltergeist
end
