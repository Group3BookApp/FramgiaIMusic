20.times do
  name = FFaker::Music.genre
  description = FFaker::Book.description
  Category.create! name: name,
    description: description
end

20.times do |n|
  name = FFaker::Music.artist
  description = FFaker::Book.description
  avatar = FFaker::Avatar.image
  Artist.create! name: name,
    description: description,
    avatar: avatar
end

20.times do |n|
  name = FFaker::Music.album
  description = FFaker::Lorem.paragraph
  avatar = FFaker::Image.url
  artist_id = rand 1..20
  Album.create! name: name,
    description: description,
    avatar: avatar,
    artist_id: artist_id
end

20.times do |n|
  name = FFaker::Name.name
  avatar = FFaker::Image.url
  Author.create! name: name,
    avatar: avatar
end

User.create! name: "Admin_system",
  email: "adminsystem@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  avatar: "https://robohash.org/impeditvoluptatemaut.png",
  confirmed_at: "2018-09-11 03:03:56.865473",
  admin: true

20.times do |n|
  name = FFaker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  avatar = FFaker::Avatar.image
  User.create! name: name,
    email: email,
    password: password,
    password_confirmation: password,
    avatar: avatar
end
