require 'spec_helper'
require 'rails_helper'

feature 'the signup process', type: :feature do
  background :each do 
    visit new_user_path
    # new_user_url ... localhost:3000/users/new
    # new_user_path ... /users/new ... why use path, shorter? no need for full?
    # in testing environment, host inst' going to be localhost:3000 all the time?
  end

  scenario "has a new user page" do
    # visit new_user_url # this is handled by our "background each"
    expect(page).to have_content "New User" # "New User" is banana-able, up to designer what we're checking for
  end

  
  feature 'signing up a user' do

    before(:each) do
      visit new_user_url
      fill_in 'Email', :with => "testing@email.com"
      fill_in 'Password', :with => "biscuits"
      click_on "create user"
    end
    
    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content "testing@email.com"
    end

  end
end

feature 'logging in' do
  before(:each) do
    visit new_session_url
    fill_in 'Email', :with => "testing@email.com"
    fill_in 'Password', :with => "biscuits"
    click_on "login"
  end

  scenario 'shows username on the homepage after login' do
    expect(page).to have_content "testing@email.com"
  end

end

feature 'logging out' do
  # before(:each) do
  #   visit new_session_url
  #   fill_in 'Email', :with => "testing@email.com"
  #   fill_in 'Password', :with => "biscuits"
  #   click_on "login"
  # end

  scenario 'begins with a logged out state' do
    expect(page).to_not have_button "logout"
  end

  scenario 'has logout button' do
    visit new_session_url
    fill_in 'Email', :with => "testing@email.com"
    fill_in 'Password', :with => "biscuits"
    click_on "login"
    expect(page).to have_button "logout"
  end

  scenario 'doesn\'t show username on the homepage after logout' do
    click_on "logout"
    expect(page).not_to have_content "testing@email.com"
  end

end