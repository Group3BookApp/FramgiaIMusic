20.times do |n|
  name = FFaker::Music.genre
  description = FFaker::Book.description sentence_count = 3
  Category.create! name: name,
    description: description
end

50.times do |n| 
  name = FFaker::Music.artist
  description = FFaker::Lorem.paragraphs
  avatar = FFaker::Image.url
  category_id = rand 1..10
  Artist.create! name: name,
    description: description,
    avatar: avatar,
    category_id: category_id
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

30.times do |n| 
  name = FFaker::Name.name
  avatar = FFaker::Image.url
  Author.create! name: name,
    avatar: avatar
end

100.times do |n|
  name = FFaker::Music.song
  data = "music-#{n+1}.mp3"
  category_id = rand 1..20
  album_id = rand 1..20
  artist_id = rand 1..50
  author_id = rand 1..30
  Song.create! name: name,
    data: data,
    category_id: category_id,
    album_id: album_id,
    artist_id: artist_id,
    author_id: author_id
end
