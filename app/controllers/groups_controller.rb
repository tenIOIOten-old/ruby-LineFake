class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @groups = Group.where(user: current_user).paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
    @content = @group.group_contents.paginate(page: params[:page])
  end

  def new
    @group = group.new
  end

  def create
    @group = Group.create(group_params.name)
    gorup_params.user_id do |n|
    @group.users<< User.find(n)
    end
    @group.save
    # if @user.save
    #   @user.send_activation_email
    #   flash[:info] = "Please check your email to activate your account."
    #   redirect_to root_url
    # else
    #   render 'new'
    # end
  end

  def edit
    @group = Group.find(params[:id])
  end
  
  def update
    @group = Group.find(params[:id])
    if @group.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  def group_params
      params.require(:group).permit(:name, :user_id)
  end

  def correct_user
      users = Group.find(params[:id]).users
      redirect_to(root_url) unless users.find(current_user)
  end
end
