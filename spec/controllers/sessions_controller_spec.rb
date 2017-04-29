require 'spec_helper'

describe SessionsController do

  describe "login" do
    context "given invalid information" do
      it "render new!" do
        get :new
        expect(response).to render_template("sessions/new")
        post :create,params: { session: { email: "", 
                                          password: ""} } 
        expect(response).to render_template("sessions/new")
        expect(flash[:danger]).not_to be_nil
      end
    end

    context "given valid information" do
      it "let user log in" do
        get :new
        expect(response).to render_template("sessions/new")
        post :create,params: { session: { email: "user1@example.com", 
                                          password: "foobar"} } 
        expect(response).to redirect_to("/")
        expect(session[:user_id]).to eq User.find_by(email: "user1@example.com").id
      end
    end
  end
end
