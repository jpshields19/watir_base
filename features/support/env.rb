# require "selenium-webdriver"
require 'watir'
# require 'minitest/autorun'
# require 'minitest/unit'
# require 'pg'
# require 'headless'
# require "socket"
# require "rspec"
require "rspec/expectations"
# require 'webdrivers'

include Selenium

# def colorize(text, color_code) "\e[#{color_code}m#{text}\e[0m" end
# def red(text); colorize(text, 31); end
# def green(text); colorize(text, "1;32"); end

#d = Selenium::WebDriver.for :chrome



Before do

  # Webdrivers::Chromedriver.required_version = '83.0.4103.39'
  # Webdrivers.install_dir = File.expand_path("../../webdrivers", File.dirname(__FILE__))
  opts = {}
  if ENV['headless'] == 'true'
    opts[:headless] = true
  end
  if ENV['remote'] == "true"
    opts[:url] = "http://#{ENV.fetch('HUB_HOST')}:4444/wd/hub"
  end
  if ENV['browser'] == 'firefox'
    browser = :firefox
  end

  # opts[:driver_path] = File.expand_path("../../webdrivers/chromedriver.exe", File.dirname(__FILE__))
  # puts opts[:driver_path]

  Selenium::WebDriver.logger.output = 'selenium.log'

  # browser = Watir::Browser.new :chrome, {timeout: 120, url: "http://localhost:4444/wd/hub"}
  browser = Watir::Browser.new browser||=:chrome, opts
  # caps = Selenium::WebDriver::Remote::Capabilities.chrome
  # client = Selenium::WebDriver::Remote::Http::Default.new
  # client.timeout = 120
  # url = "http://localhost:4444/wd/hub"
  #
  # browser = Watir::Browser.new :remote, {desired_capabilities: caps, http_client: client, url: url}
  @browser = browser
end

After do
  @browser.screenshot.save 'screenshot.png'
	@browser.close
end
