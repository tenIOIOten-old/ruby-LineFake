# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = User.create(name:"Tenta",email: "tenta@user.com",password: "foobar",password_confirmation:"foobar")
user2 = User.create(name:"Shiratori",email:"tenta@example.com",password: "foobar",password_confirmation:"foobar")
20.times do
Micropost.create(user: user1,content: Faker::Pokemon.name)
Micropost.create(user: user2,content: Faker::Pokemon.name)
end
group = Group.create(name: "Sample")
group.users << user1
group.users << user2
group.save
group.group_contents.create(user: user1,content: Faker::Pokemon.name)
group.group_contents.create(user: user2,content: Faker::Pokemon.name)

5.times do |n|
	group.group_contents.create(user: user1,content: Faker::Pokemon.name)
end
5.times do |n|
	group.group_contents.create(user: user2,content: Faker::Pokemon.name)
end