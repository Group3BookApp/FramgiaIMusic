require "rails_helper"
 RSpec.feature "User", type: :feature, js: true do
  let(:user) {FactoryBot.create :user}

  scenario "Edit" do
    visit root_path
    page.find("#loginButton").click
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in"
    visit "/user"
    click_link "Account Settings"
    fill_in "Name", with: "ahehehehehe"
    page.find("#rspec_update").click
    expect(page).to have_content "Profile was successfully updated."
  end
end
