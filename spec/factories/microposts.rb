# Read about factories at https://github.com/thoughtbot/factory_girl
FactoryGirl.define do
  factory :micropost do
    content Faker::Pokemon.name
  end
end
# user = FactoryGirl.create(:user)
# FactoryGirl.create_list(:micropost,20,user: user)
