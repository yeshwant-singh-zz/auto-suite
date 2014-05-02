require 'selenium-webdriver'
require "#{File.dirname(__FILE__)}/helper.rb"
include Helper

browser = Selenium::WebDriver.for :firefox

Before do |scenario|
	@browser = browser
	@browser.manage.window.maximize
	@browser.manage.delete_all_cookies    #singingout out user before each scenario
end

at_exit do
	browser.quit
end

# we can add code to take screenshots on failure 
