require "rails_helper"

describe "the group show path", vcr: true do
  it "displays a group's information and messages" do
    visit '/groups'
    click_link 'group-1'
    expect(page).to have_content("Discussion")
  end

  it "displays an error if group cannot be found" do
    visit '/groups/0'
    expect(page).to have_content("Group not found.")
  end
end
