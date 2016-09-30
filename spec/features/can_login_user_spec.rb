require 'rails_helper'

feature "Log in" do
  background do
    User.create(:email => 'user@example.com', :password => 'caplin')
  end

  scenario "Signing in with correct credentials" do
    visit root_path

    click_on('Sign In')

    expect(page).to have_selector('#logInModal')

    within("#logInModal") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  end

  scenario "with wrong credentials" do
    visit root_path

    click_on('Sign In')

    expect(page).to have_selector('#logInModal')

    within("#logInModal") do
      fill_in 'Email', :with => 'notmyemail@email.com'
      fill_in 'Password', :with => 'not-my-password'
    end
    click_button 'Log in'
    expect(page).to have_content 'Invalid Email or password'
  end
end