require "rails_helper"
 RSpec.feature "User", type: :feature, js: true do
  let(:user) {FactoryBot.create :user}

  scenario "Login fail" do
    login false
    expect(page).to have_content "Invalid Email or password."
  end
  scenario "Login correct" do
    login true
    expect(page).to have_content "Signed in successfully."
  end
  scenario "Log out" do
    login true
    visit "/user"
    click_link "Log out", visible: false
    expect(page).to have_content "Signed out successfully."
  end

  def login valid_pass
    visit root_path
    page.find("#loginButton").click
    fill_in "Email", with: user.email
    if valid_pass
      fill_in "Password", with: user.password
    else
      fill_in "Password", with: "11111a"
    end
    click_button "Log in"
  end
end
