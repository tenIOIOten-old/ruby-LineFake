class GroupContentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @speech = @group.group_contents.build(user: corrent_user,content: speechparams)
    if @speech.save
      flash[:success] = "Micropost Created"
    else
      flath[:danger] = "Invalid Value"
    end
    redirect_to @group
  end

  def destroy
    @group.group_contents(params[:id]).destroy
    flash[:success] = "Micropost deleted"
    redirect_to  @group
  end
  private

    def speech_params
      params.require(:speech).permit(:content)
    end

    def correct_user
      @group = Group.find(params[:group_id]).find_by(id: params[:id])
      redirect_to root_url if @group.nil?
    end

    def logged_in_user
      @group = corrent_user.groups.find(params[:group_id])
      unless logged_in? || @group.present?
        flash[:danger] = "Please log in."
        redirect_to login_url
      else
      end
      
    end
end
