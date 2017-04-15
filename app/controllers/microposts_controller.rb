class MicropostsController < ApplicationController
  def index
    @microposts = Micropost.all
  end

  def show
    @micropost = Micropost.find(params[:id])
  end
end
