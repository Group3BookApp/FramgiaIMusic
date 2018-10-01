require "ffaker"
FactoryBot.define do
  factory :artist, class: Artist do |f|
    f.name {FFaker::Name.name}
    f.avatar {FFaker::Avatar.image}
    f.description {FFaker::Lorem.paragraph}
  end
end
