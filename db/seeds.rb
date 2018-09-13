User.create! name: "Admin_system1",
  email: "adminsystem1@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  confirmed_at: "2018-09-11 03:03:56.865473",
  admin: true

20.times do
  name = FFaker::Music.genre
  description = FFaker::Book.description sentence_count = 3
  Category.create! name: name,
    description: description
end

20.times do |n|
  name = FFaker::Music.album
  description = FFaker::Lorem.paragraph
  Artist.create! name: name,
    description: description
end

20.times do |n|
  name = FFaker::Name.name
  description = FFaker::Lorem.paragraph
  Author.create! name: name,
    description: description
end

20.times do
  name = FFaker::Music.artist
  description = FFaker::Lorem.paragraph
  artist_id = rand 1..20
  Album.create! name: name,
    description: description,
    artist_id: artist_id
end