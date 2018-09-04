User.create! name: "Admin_system",
  email: "adminsystem@gmail.com",
  password: "111111",
  password_confirmation: "111111",
  admin: true

User.create! name: "Admin_system1",
  email: "adminsystem1@gmail.com",
  password: "111111",
  password_confirmation: "111111",
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
