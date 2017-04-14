require 'spec_helper'

describe "Users"  do
  # describe "GET /users" do
  #   it "works! (now write some real specs)" do
  #     # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
  #     get users_path
  #     response.status.should be(200)
  #   end
  # end

  describe "GET /users/new",type: :request do
    it "works with valid value! (create user)" do
      get new_user_path 

      expect{ post users_path,params: { user:{  name:  "UserCreate",
                       email: "user@example.com",
                       password:              "foobar",
                       password_confirmation: "foobar" } }
      }.to change{User.count}.by(1)
                      
    end
    it "not works with invalid value! (create user)" do
      get new_user_path 

      expect{post users_path,params: { user:{  name:  "",
                       email: "",
                       password:              "fooba",
                       password_confirmation: "fooba" } }
      }.not_to change{User.count}.by(1)
                      
    end
  end
end
