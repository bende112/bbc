Before do

  # browser = Capybara.current_session.driver.browser
  # if browser.respond_to?(:clear_cookies)
  #   browser.clear_cookies
  #   puts 'Before do: browser responded to :clear_cookies'
  # elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
  #   # Selenium::WebDriver
  #   browser.manage.delete_all_cookies
  #   puts 'Before do: browser responded to :delete_all_cookies'
  # else
  #   raise "Don't know how to clear cookies. Weird driver?"
  # end

end

# After do
#   browser = Capybara.current_session.driver.browser
#   if browser.respond_to?(:clear_cookies)
#     browser.clear_cookies
#     puts 'After do: browser responded to :clear_cookies'
#   elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
#     browser.manage.delete_all_cookies
#     puts 'After do: browser responded to :delete_all_cookies'
#   else
#     raise "Don't know how to clear cookies. Weird driver?"
#   end
#   # page.execute_script("localStorage.clear()")
#   puts 'After do: execute_script - localStorage.clear()'
#   Capybara.reset_sessions!
#   puts 'After do: reset session called!'
#   Capybara.current_session.driver.quit
#   puts 'After do: current_session.driver.quit!'
# end

After do |scenario|
  browser = Capybara.current_session.driver.browser
  if browser.respond_to?(:clear_cookies)
    browser.clear_cookies
    puts 'After do: browser responded to :clear_cookies'
  elsif browser.respond_to?(:manage) and browser.manage.respond_to?(:delete_all_cookies)
    browser.manage.delete_all_cookies
    puts 'After do: browser responded to :delete_all_cookies'
  else
    raise "Don't know how to clear cookies. Weird driver?"
  end
  # page.execute_script("localStorage.clear()")
  puts 'After do: execute_script - localStorage.clear()'
  Capybara.reset_sessions!
  puts 'After do: reset session called!'
  Capybara.current_session.driver.quit
  puts 'After do: current_session.driver.quit!'
end



