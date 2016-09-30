require 'rails_helper'

feature "Creating a new post" do
  background do
    User.create(:email => 'user@example.com', :password => 'caplin')
  end

  scenario "signed in user can create a new post" do
    visit root_path

    click_on('Sign In')

    expect(page).to have_selector('#logInModal')

    within("#logInModal") do
      fill_in 'Email', :with => 'user@example.com'
      fill_in 'Password', :with => 'caplin'
    end
    click_button 'Log in'
    expect(page).to have_content 'Signed in successfully'
  #should be back at posts#index page

    click_on('New Post')

    expect(page).to have_content 'New Post'
    within("#new-post-form") do
      fill_in('Title', :with => 'Test Title')
      fill_in('Post', :with => 'Test Post')
    end

    click_on('Create Post')

    expect(page).to have_content 'Post was successfully created.'

    click_on('Rails Review Page')

    expect(page).to have_content 'Test Title'
  end
end
