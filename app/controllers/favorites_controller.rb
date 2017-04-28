class FavoritesController < ApplicationController
  before_action :logged_in_user

  def create
    @micropost = Micropost.find(params[:micropost_id])
    current_user.favorite(@micropost)
    respond_to do |format|
      format.html { redirect_to @micropost }
      format.js
    end
  end

  def destroy
    @micropost = Favorite.find(params[:id]).micropost
    current_user.unfavorite(@micropost)
    respond_to do |format|
      format.html { redirect_to @micropost }
      format.js
    end
  end
end
