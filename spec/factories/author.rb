require "ffaker"
FactoryBot.define do
  factory :author, class: Author do |f|
    f.name {FFaker::Name.name}
    f.description {FFaker::Lorem.paragraph}
  end
end
