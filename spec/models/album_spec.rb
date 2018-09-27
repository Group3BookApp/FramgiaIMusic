require "rails_helper"
RSpec.describe Album, :type => :model do
  let(:album) {FactoryBot.create :album}

  describe "associations" do
    it {is_expected.to have_many :songs}
    it {is_expected.to belong_to :artist}
  end

  describe "validation" do
    it "has a valid factory" do
      expect(album).to be_valid
    end

    it "has invalid validate" do
      album.name = nil
      expect(album).to_not be_valid
    end

    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of :name}
    it {is_expected.to validate_length_of :description}
    it {is_expected.to validate_presence_of :artist_id}
  end

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:avatar).of_type :string}
      it {is_expected.to have_db_column(:description).of_type :text}
      it {is_expected.to have_db_column(:artist_id).of_type :integer}
    end
  end
end
