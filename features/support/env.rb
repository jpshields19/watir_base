require 'watir'
require 'webdrivers'

Before do
  browser = Watir::Browser.new :chrome
  @browser = browser
end

After do
  @browser.close
end
