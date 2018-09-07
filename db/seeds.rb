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
