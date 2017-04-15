class MicropostsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_actoin :corrnet_user, only: :destroy
  def show
  	@micropost = Micropost.find(params[:id])
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = "Micropost Created"
    else
      flath[:danger] = "Invalid Value"
    end
    redirect_to root_path
  end

  def destroy
    @micropost.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  private

    def micropost_params
      params.require(:micropost).permit(:content, :picture)
    end

    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end

    def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
end
