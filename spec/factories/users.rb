# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name "Example Test"
    email "user@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end

30.times do |i|
  FactoryGirl.create(:user,name:Faker::Name.name,email:"user#{i}@example.com")
end
