require "rails_helper"
RSpec.feature "User", type: :feature, js: true do
  let!(:user) {FactoryBot.create :user}
  let(:valid_attributes) { FactoryBot.attributes_for(:user) }

  scenario "Sign up" do
    visit root_path
    click_on "Sign up"
    fill_in "Email", with: valid_attributes[:email]
    fill_in "Password", with: "111111"
    fill_in "Password confirmation", with: "111111"
    click_button "CREATE ACCOUNT"
  end
end
