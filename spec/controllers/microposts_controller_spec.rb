require 'spec_helper'

describe MicropostsController do
  before{  
      user = User.find(1)
      log_in(user)
  }
  describe "#create"do
    it "works!" do 
      expect{post :create,params: {micropost:{content:"hello"}}}.to change{Micropost.count}.by(1)
    end
  end
  describe "#destroy"do
    
  end
end
