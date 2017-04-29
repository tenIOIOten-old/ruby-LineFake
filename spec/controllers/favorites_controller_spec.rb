require 'spec_helper'

describe FavoritesController do
  before{
    # User and Micropost deta is created 
    FactoryGirl.create(:micropost)
    log_in User.find(1)
  }
  describe "GET 'create'" do
    it "make Favorite field create" do
      expect{post :create,params: {micropost_id: 1}}.to change{Favorite.count}.by(1)
    end
  end

  describe "GET 'destroy'" do
    before{ FactoryGirl.create(:favorite,user: User.first,micropost: Micropost.first)}
    it "make Favorite field destroy" do
      expect{delete :destroy,params: {id: 1}}.to change{Favorite.count}.by(-1)
    end
  end

end
