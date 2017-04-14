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
      end
    end
  end
end
