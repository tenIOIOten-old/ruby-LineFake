# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :group_content do
  	content {Faker::Name.name}
  	group
  	user
  end
end
