require "rails_helper"

describe "the message update path", vcr: true do
  it "allows a user to update their own message" do
    FactoryBot.create(:user, name: "Arcade1", email: "arcade1@fota.org", password: "gannon", password_confirmation: "gannon")
    visit '/signin'
    fill_in 'email', with: 'arcade1@fota.org'
    fill_in 'password', with: 'gannon'
    click_button 'Sign In'
    visit '/groups'
    click_link 'group-1'
    fill_in 'content', with: "This is a new test message."
    click_button "Post"
    click_link 'Edit'
    fill_in 'content', with: "This is an update to the test message."
    click_button 'Post'
    expect(page).to have_content("This is an update to the test message.")
  end
end
