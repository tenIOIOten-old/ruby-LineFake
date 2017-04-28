require 'spec_helper'

describe RelationshipsController do
  before{
    # User and Micropost deta is created 
    FactoryGirl.create_list(:user,2)
    log_in User.find(1)
  }
  describe "GET 'create'" do
    it "make  relationship" do
      expect{post :create,params: {followed_id: 1}}.to change{Relationship.count}.by(1)
    end
  end

  describe "GET 'destroy'" do
    before{ FactoryGirl.create(:relationship,follower: User.first,followed: User.find(2))}
    it "delete relationship" do
      expect{delete :destroy,params: {id: 1}}.to change{Relationship.count}.by(-1)
    end
  end

end
