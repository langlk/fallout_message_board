require "rails_helper"

describe "user signin path", vcr: true do

  it "allows user to sign in with email and password" do
    FactoryBot.create(:user, name: "Veronica", email: "v@brotherhoodofsteel.org", password: "powergauntlet", password_confirmation: "powergauntlet")
    visit '/signin'
    fill_in 'email', with: 'v@brotherhoodofsteel.org'
    fill_in 'password', with: 'powergauntlet'
    click_button 'Sign In'
    expect(page).to have_content('Welcome back, Veronica')
  end

  it "displays an error if user cannot be signed in" do
    visit '/signin'
    click_button 'Sign In'
    expect(page).to have_content('Incorrect email or password')
  end
end
