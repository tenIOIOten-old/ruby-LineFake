# Read about factories at https://github.com/thoughtbot/factory_girl
User.create(name:"tenta",email:"user0@example.com",password: "foobar",password_confirmation:"foobar")
FactoryGirl.define do
  factory :micropost do
    content "content"
    user_id User.first.id
  end
end
30.times do
	FactoryGirl.create(:micropost,content:Faker::Pokemon.name)
end