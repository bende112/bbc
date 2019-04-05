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
  all('.hp-module__container .top-story__image')[1].click()
  sleep 1
  puts headline
end

And(/^i click on the "([^"]*)" below the page$/) do |viewComments|
  within('.comments-button')do
    find('a', :text => 'View comments').click()
    puts "comment button clicked"
    sleep 1
    puts viewComments
  end
end

Then(/^the "([^"]*)" page is displayed$/) do |comments|
  page.has_css?('h3', :text => 'comments')
  sleep 1
  page.execute_script "window.scrollBy(0,10000)"
end

And(/^i click on the "([^"]*)" on the tool bar$/) do |signIn|
  within('#orb-header')do
    find('#idcta-username').click()
    sleep 2
  end
end

And(/^the "([^"]*)" page modal is displayed$/) do |signinPage|
  page.has_css?('h1', :text => 'signinPage')
end

And(/^i enter "([^"]*)" on the email field$/) do |emailAddress|
  all('.page__content .field__input').first.set(emailAddress)
  sleep 2
end

And(/^i enter "([^"]*)" on the password field$/) do |myPassword|
  all('.page__content .field__input').last.set(myPassword)
  sleep 2
end

When(/^i click on the "([^"]*)" button$/) do |signinButton|
  find('.page__content .button--full-width', :text => 'Sign in').click()
  puts signinButton
end

Then(/^"([^"]*)" home page is displayed$/) do |homePage|
  page.has_css?('h2', :text => 'homePage')
  puts 'BBC home page is displayed'
end