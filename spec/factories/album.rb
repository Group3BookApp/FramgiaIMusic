require "ffaker"
FactoryBot.define do
  factory :album do |f|
    f.name {FFaker::Name.name}
    f.avatar {FFaker::Avatar.image}
    f.description {FFaker::Lorem.paragraph}
    f.artist_id {rand 1..10}
  end
end
