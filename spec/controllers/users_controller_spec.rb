require 'spec_helper'

describe UsersController do
	
	describe "sign up" do
		context "given valid information" do
			it "create user account" do
				get :new
				expect(response).to render_template("users/new")
				expect{post :create,params: { user:{  name:  "UserCreate",
	                       email: "user@example.com",
	                       password:              "foobar",
	                       password_confirmation: "foobar" } }
	      }.to change{User.count}.by(1)
	                      
	    end
	  end
	  context "given invalid information" do
	    it "do nothing" do
	      get :new

	      expect{post :create,params: { user:{  name:  "",
	                       email: "",
	                       password:              "fooba",
	                       password_confirmation: "fooba" } }
	      }.not_to change{User.count}.by(1)                  
    	end
		end
	end
end
