require 'spec_helper'

describe SessionsController do
  describe "login" do
    context "with invalid information" do
      it "works!" do
        get :new
        expect(response).to render_template("sessions/new")
        post :create,params: { session: { email: "", password: "" }  }
        expect(response).to render_template("sessions/new")
      end
    end
  end
end
