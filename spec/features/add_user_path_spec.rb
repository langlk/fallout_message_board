require "rails_helper"

describe "adding a new user", vcr: true do
  it "allows a user to register for a new account" do
    visit '/signup'
    fill_in 'user_name', with: 'ED-E'
    fill_in 'user_email', with: 'new@vegas.com'
    fill_in 'user_password', with: 'newvegas'
    fill_in 'user_password_confirmation', with: 'newvegas'
    click_button 'Sign Up'
    expect(page).to have_content("Account created successfully!")
  end

  it "displays error messages if user account cannot be created" do
    visit '/signup'
    click_button 'Sign Up'
    expect(page).to have_content("Something went wrong!")
  end
end
