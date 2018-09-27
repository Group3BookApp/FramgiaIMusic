require "ffaker"
FactoryBot.define do
  factory :song, class: Song do |f|
    f.name {FFaker::Name.name}
    f.data {Rack::Test::UploadedFile.new(Rails.root.join("spec/uploads/data/After-The-Afterparty.mp3"),
      "audio/mp3") }
    f.avatar {FFaker::Avatar.image}
    f.listening {rand 30..100}
    f.artist_id {rand 1..10}
    f.album_id {rand 1..10}
    f.author_id {rand 1..10}
    f.category_id {rand 1..10}
  end
end
