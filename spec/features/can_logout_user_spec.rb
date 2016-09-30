require 'rails_helper'

feature "Log out" do
  background do
    User.create(:email => 'user@example.com', :password => 'caplin')
  end

  scenario "Signing in and then logging out" do
    visit root_path

    click_on('Sign In')

    expect(page).to have_selector('#logInModal')

    within("#logInModal") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'

    click_on('Sign Out')

    expect(page).to have_content 'Signed out successfully'
  end
end