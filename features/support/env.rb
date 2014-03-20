require 'bundler'
Bundler.require

require_relative 'screen_helper'

APP_PATH = ENV['APP_PATH'] || '../../QuickContacts.app'

def absolute_app_path
File.join(File.dirname(__FILE__), APP_PATH)
end

class AppiumDriver < Capybara::Selenium::Driver
  attr_accessor :native_interaction

  def browser
    @browser ||= Selenium::WebDriver.for(:remote, :desired_capabilities => {
        'browserName' => 'iOS',
        'device'      => 'iphone simulator',
        'platform'    => 'Mac',
        'version'     => '6.1',
        'app'         => absolute_app_path
    },                                   :url                           => 'http://127.0.0.1:4723/wd/hub')
  end

  Capybara.add_selector(:tag_name) { xpath { |tag_name| tag_name } }

  # Hack!! Appium does not know anything about css selectors. We fake css selector to be a name selector
  def find_css(selector)
    browser.find_elements(:name, selector).map { |node| Capybara::Selenium::Node.new(self, node) }
  end

  def execute_script(script, *args)
    browser.execute_script script, *args
  end

end

Capybara.register_driver(:appium) { |app| AppiumDriver.new(app) }
Capybara.default_driver = :appium

World(ScreenHelper)