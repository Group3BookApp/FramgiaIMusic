require "ffaker"
FactoryBot.define do
  factory :user, class: User do |f|
    f.name {FFaker::Name.name}
    f.email {FFaker::Internet.email}
    f.avatar {FFaker::Avatar.image}
    f.password {"111111"}
    f.password_confirmation {"111111"}
    f.confirmed_at {"2018-09-11 03:03:56.865473"}
    f.admin {true}
  end
end
