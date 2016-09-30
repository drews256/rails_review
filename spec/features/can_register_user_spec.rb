require 'rails_helper'

describe "the registration process", :type => :feature do
  before :each do
    User.new(:email => 'user@example.com', :password => 'password')
  end

  it "doesn't register me in with not enough information" do
    visit '/users/sign_up'
    within("#new_session") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'error'
  end

  it "registers me with proper information" do
    visit '/users/sign_up'
    within("#new_session") do
      fill_in 'First name', :with => 'Andrew'
      fill_in 'Last name', :with => 'Test'
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'password'
      fill_in 'Password confirmation', :with => 'password'
    end
    click_button 'Sign up'
    expect(page).to have_content 'success'
  end
end