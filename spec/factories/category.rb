require "ffaker"
FactoryBot.define do
  factory :category do |f|
    f.name {FFaker::Name.name}
    f.description {FFaker::Lorem.paragraph}
  end
end
