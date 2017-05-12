# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user1 = FactoryGirl.create(:user,name:"Tenta",email: "tenta@user.com")
user2 =FactoryGirl.create(:user,name:"Shiratori",email:"tenta@example.com")
FactoryGirl.create_list(:user,20)
FactoryGirl.create_list(:micropost,20,user: user1)
FactoryGirl.create_list(:micropost,20,user: user2)
group = Group.create(name: "Sample")
group.users << user1
group.users << user2
group.save
group.group_contents.create(user: user1,content: Faker::Pokemon.name)
group.group_contents.create(user: user2,content: Faker::Pokemon.name)

5.time do |n|
	group.group_contents.create(user: user1,content: Faker::Pokemon.name)
end
5.time do |n|
	group.group_contents.create(user: user2,content: Faker::Pokemon.name)
end