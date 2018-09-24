require "rails_helper"
RSpec.describe Author, :type => :model do
  let(:author) {FactoryBot.create :author}

  describe "associations" do
    it {is_expected.to have_many :songs}
  end

  describe "validations" do
    it "has a valid factory" do
      expect(author).to be_valid
    end
    it "has a invalid validate" do
      author.name = nil
      expect(author).to_not be_valid
    end

    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of :name}
    it {is_expected.to validate_length_of :description}
  end

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:description).of_type :text}
      it {is_expected.to have_db_column(:avatar).of_type :string}
    end
  end
end
