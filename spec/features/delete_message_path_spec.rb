require "rails_helper"

describe "the message delete path", vcr: true do
  it "allows a user to delete their own message" do
    FactoryBot.create(:user, name: "Arcade2", email: "arcade2@fota.org", password: "gannon", password_confirmation: "gannon")
    visit '/signin'
    fill_in 'email', with: 'arcade2@fota.org'
    fill_in 'password', with: 'gannon'
    click_button 'Sign In'
    visit '/groups'
    click_link 'group-1'
    fill_in 'content', with: "This is a test message for deletion."
    click_button "Post"
    click_link 'Delete'
    expect(page).to have_no_content("This is a test message for deletion.")
  end
end
