require "rails_helper"
RSpec.describe Song, :type => :model do
  let(:song) {FactoryBot.create :song}

  describe "associations" do
    it {is_expected.to belong_to :author}
    it {is_expected.to belong_to :artist}
    it {is_expected.to belong_to :album}
    it {is_expected.to belong_to :category}
  end

  describe "validation" do
    it "has a valid factory" do
      expect(song).to be_valid
    end
    it "has a invalid validate" do
      song.name = nil
      expect(song).to_not be_valid
    end

    it {is_expected.to validate_presence_of :name}
    it {is_expected.to validate_length_of :name}
    it {is_expected.to validate_presence_of :author_id}
    it {is_expected.to validate_presence_of :artist_id}
    it {is_expected.to validate_presence_of :album_id}
    it {is_expected.to validate_presence_of :category_id}
  end

  describe "db schema" do
    context "columns" do
      it {is_expected.to have_db_column(:name).of_type :string}
      it {is_expected.to have_db_column(:data).of_type :string}
      it {is_expected.to have_db_column(:avatar).of_type :string}
      it {is_expected.to have_db_column(:listening).of_type :integer}
      it {is_expected.to have_db_column(:author_id).of_type :integer}
      it {is_expected.to have_db_column(:artist_id).of_type :integer}
      it {is_expected.to have_db_column(:album_id).of_type :integer}
      it {is_expected.to have_db_column(:category_id).of_type :integer}
    end
  end

  describe "instance methods" do
    it {is_expected.to respond_to(:increase_listening)}
  end
end
