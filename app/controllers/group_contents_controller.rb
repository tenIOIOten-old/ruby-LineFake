class GroupContentsController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user, only: :destroy

  def create
    @content = @group.group_contents.build(user: current_user,content: content_params[:content])
    if @content.save
      flash[:success] = "Message Send"
    else
      flath[:danger] = "Invalid Value"
    end
    redirect_to @group
  end

  def destroy
    @group_content.delete
    flash[:success] = "Micropost deleted"
    redirect_to  @group
  end

  private

    def content_params
      params.require(:group_content).permit(:content)
    end

    def correct_user
      @group_content = @group.users.find(current_user).group_contents.find(params[:id])
      redirect_to root_url if @group.nil?
    end

    def logged_in_user
      @group = current_user.groups.find(params[:group_id])
      unless logged_in? || @group.present?
        flash[:danger] = "Please log in."
        redirect_to login_url
      else
      end
      
    end
end
