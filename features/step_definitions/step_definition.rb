require 'helper'

Given('I open google') do
  @browser.goto 'www.google.com'
  @google = Helper::PageObject.new(@browser, 'google')
end

Given('I open amazon') do
  @amazon = Helper::Page.new(@browser, 'amazon')
  @amazon.visit
  log @amazon.methods(false)
end

When('I search for cats') do
  @google.search = "cat"
  @google.google_search
  sleep 10
end

When('I search amazon for {string}') do |string|
  @amazon.search = string
  @amazon.search_button
  sleep 10
end

Then('I should see cats') do
  pending # Write code here that turns the phrase above into concrete actions
end
