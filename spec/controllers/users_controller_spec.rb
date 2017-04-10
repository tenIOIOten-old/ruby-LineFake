require 'spec_helper'

describe UsersController do
	
	test "should create user with valid value" do
		post users_path , params: [ name: 								"Tenta",
																email: 								"user@email.com",
																password: 						"foobar",
																password_confimation: "foobar"]
		assert_redirected_to root_path
	end

	test "should not create user with invalid value" do
		get new_users_path
		assert_no_difference 'User.count' do
			post users_path , params: [ name: 								"",
																	email: 								"example",
																	password: 						"foo",
																	password_confimation: "bar"]
		end
		assert_template "users/new"
	end
end
