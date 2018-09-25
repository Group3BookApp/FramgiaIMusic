require "ffaker"
FactoryBot.define do
  factory :artist do |f|
    f.name {FFaker::Name.name}
    f.avatar {FFaker::Avatar.image}
    f.description {FFaker::Lorem.paragraph}
  end
end
