20.times do
  name = FFaker::Music.genre
  description = FFaker::Book.description sentence_count = 3
  Category.create! name: name,
    description: description
end

20.times do |n|
  name = FFaker::Music.artist
  description = FFaker::Lorem.sentences
  avatar = FFaker::Image.url
  Artist.create! name: name,
    description: description,
    avatar: avatar
end

User.create! name: "Admin_system",
  email: "adminsystem@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  confirmed_at: "2018-09-11 03:03:56.865473",
  admin: true

User.create! name: "Admin_system1",
  email: "adminsystem1@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  confirmed_at: "2018-09-11 03:03:56.865473",
  admin: true

30.times do |n|
  name = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password
end
