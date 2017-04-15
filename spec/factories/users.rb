# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Example Test"
    email "user0@example.com"
    initialize_with { User.find_or_create_by(email: email)}
    password "foobar"
    password_confirmation "foobar"
  end
end

30.times do |i|
  FactoryGirl.create(:user,name:Faker::Name.name,email:"user#{i}@example.com")
end
