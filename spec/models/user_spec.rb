require "rails_helper"
RSpec.describe User, :type => :model do
  let(:user) {FactoryBot.create :user}

  describe "validation" do
    it "has a valid factory" do
      expect(user).to be_valid
    end
    it "has a invalid validate" do
      user.email = nil
      user.password = nil
      expect(user).to_not be_valid
    end

    it {is_expected.to validate_presence_of :email}
    it {is_expected.to validate_presence_of :password}
  end

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:email).of_type :string}
      it {is_expected.to have_db_column(:avatar).of_type :string}
      it {is_expected.to have_db_column(:admin).of_type :boolean}
      it {is_expected.to have_db_column(:encrypted_password).of_type :string}
      it {is_expected.to have_db_column(:confirmed_at).of_type :datetime}
    end
  end
end
