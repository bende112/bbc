require 'rubygems'
require 'capybara'
require 'capybara/dsl'
require 'rspec'
require 'selenium-webdriver'
require 'capybara/angular'
require 'rspec/retry'
require 'rest-client'
require 'logger'
require 'json'
require 'net/http/post/multipart'
#require 'test/unit/assertions'
#require 'capybara-screenshot'
#require 'capybara-screenshot/cucumber'


# Capybara::Screenshot.s3_configuration = {
#     s3_client_credentials: {
#         access_key_id: "",
#         secret_access_key: "",
#         region: "eu-west-1"
#     },
#     bucket_name: "amalytics-testing"
# }

# RSpec.configure do |config|
#   # show retry status in spec process
#   config.verbose_retry = true
#   # Try twice (retry once)
#   config.default_retry_count = 2
#   # Only retry when Selenium raises Net::ReadTimeout
#   config.exceptions_to_retry = [Net::ReadTimeout]
# end

Capybara.register_driver :selenium_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  # options.add_argument("--window-size=1024,768")
  options.add_argument("--start-fullscreen");
  options.add_argument('--incognito')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end


# Capybara.register_driver :selenium_chrome do |app|
# #   # Capybara::Selenium::Driver.new(app, browser: :chrome, switches: ['--incognito'])
# #   # Capybara::Selenium::Driver.new(app, :browser => :chrome)
# #   # or
# #   # Capybara::Selenium::Driver.new(app, browser: :chrome, args: ['--incognito'])
#    Capybara::Selenium::Driver.new(app, browser: :chrome, switches: ['--incognito'])
# end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome
  config.default_selector = :css
  config.run_server = false
  puts 'Capybara.configure: capybara settings set'
end
Capybara.ignore_hidden_elements = false
Capybara.ignore_hidden_elements = true
Capybara.default_max_wait_time = 5

 #profile = Selenium::WebDriver::Firefox::Profile.new
 #profile.assume_untrusted_certificate_issuer = true
 #Capybara.register_driver :firefox do |app|
 #  options = {
    #   :js_errors => true,
   #    :timeout => 360,
  #    :debug => false,
 #      :inspector => false,
#  }
 # Capybara::Selenium::Driver.new(app, :browser => :firefox, :profile => profile)
#end
#

## Change this to change browser
# Capybara.default_driver = :selenium_chrome
Capybara.javascript_driver = :selenium_chrome


module Helpers
  def without_resynchronize
    page.driver.options[:resynchronize] = false
    yield
    page.driver.options[:resynchronize] = true
  end
end

World(Capybara::DSL, Helpers)
