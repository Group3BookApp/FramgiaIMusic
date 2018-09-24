require "ffaker"
FactoryBot.define do
  factory :song do |f|
    f.name {FFaker::Name.name}
    f.data {"music.mp3"}
    f.avatar {FFaker::Avatar.image}
    f.listening {rand 30..100}
    f.artist_id {1}
    f.album_id {1}
    f.author_id {1}
    f.category_id {1}
  end
end
