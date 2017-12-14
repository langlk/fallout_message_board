require "rails_helper"

describe "the message creation path", vcr: true do
  it "allows a user to post a new message" do
    FactoryBot.create(:user, name: "Arcade", email: "arcade@fota.org", password: "gannon", password_confirmation: "gannon")
    visit '/signin'
    fill_in 'email', with: 'arcade@fota.org'
    fill_in 'password', with: 'gannon'
    click_button 'Sign In'
    visit '/groups'
    click_link 'group-1'
    fill_in 'content', with: "This is a new test message."
    click_button "Post"
    expect(page).to have_content("This is a new test message.")
  end
end
