Given(/^I visit "([^"]*)"$/) do |path|
  visit baseUrl() #+ path
end

Given(/^i visit bbc "([^"]*)"$/) do |homePage|
  page.has_css?('h2', :text => 'homePage')
end

Given(/^the BBC the Home Page is displayed$/) do
  page.has_css?('h2', :text => 'homePage')
  sleep 2
end

When(/^i click on "([^"]*)"$/) do |headline|
  all('.hp-module__container .top-story__image')[0].click()
  sleep 5
  puts headline
end

And(/^i click on the "([^"]*)" below the page$/) do |viewComments|
  within('.comments-button')do
    find('a', :text => 'View comments').click()
    puts "comment button clicked"
    sleep 3
    puts viewComments
  end
end

Then(/^the "([^"]*)" page is displayed$/) do |comments|
  page.has_css?('h3', :text => 'comments')
  sleep 4
  page.execute_script "window.scrollBy(0,10000)"
end