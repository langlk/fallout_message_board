require "rails_helper"

describe "the groups index path", vcr: true do
  it "allows a user to view all groups" do
    visit '/groups'
    expect(page).to have_content("All Groups")
  end
end
