require "rails_helper"
RSpec.describe Song, :type => :model do
  describe "associations" do
    it {is_expected.to belong_to :author}
  end
end
