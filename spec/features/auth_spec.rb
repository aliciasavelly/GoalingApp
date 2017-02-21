require 'spec_helper'
require 'rails_helper'

feature "the signup process" do

  scenario "has a new user page" do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    before (:each) do
      visit new_user_url
      fill_in 'username', with: 'userserser'
      fill_in 'password', with: 'passworworword'
      click_on "Create User"
    end

    scenario "shows username on the homepage after signup" do
      expect(page).to have_content 'userserser'
    end
  end

end

feature "logging in" do

  before (:each) do
    sign_up_userserser
    click_on "Log Out"
    visit new_session_url
    fill_in 'username', with: 'userserser'
    fill_in 'password', with: 'passworworword'
    click_on "Sign In"
  end

  scenario "shows username on the homepage after login" do
    expect(page).to have_content 'userserser'
  end

end

feature "logging out" do

  before (:each) do
    sign_up_userserser
    click_on "Log Out"
    visit new_session_url
    fill_in 'username', with: 'userserser'
    fill_in 'password', with: 'passworworword'
    click_on "Sign In"
  end

  scenario "only displays log out button when logged in" do
    expect(page).to have_button("Log Out")
    click_on('Log Out')
    expect(page).not_to have_button("Log Out")
  end

  scenario "doesn't show username on the homepage after logout" do
    expect(page).to have_content 'userserser'
    click_on('Log Out')
    expect(page).not_to have_content 'userserser'
  end

end
