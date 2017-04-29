class GroupsController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update, :destroy]
  def index
    @groups = current_user.groups.paginate(page: params[:page])
  end

  def show
    @group = Group.find(params[:id])
    @contents = @group.group_contents.paginate(page: params[:page])
  end

  def new
    @group = Group.new
    @users = current_user.friend
  end

  def create
    @group = Group.new(name: group_params[:name])
    if @group.save
      @group.users<< current_user
      unless group_params[:user_id].nil? 
        group_params[:user_id].each do |n|
          @group.users<< User.find(n)
        end
      end
      @group.save
      redirect_to @group
    else
      redirect_to new_group_path
    end
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
    if @group.update_attributes(group_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    Group.find(params[:id]).users.delete(current_user)
    flash[:success] = "group deleted"
    redirect_to groups_url
  end

  private

  def group_params
      params.require(:group).permit(:name, user_id: [])
  end

  def correct_user
      users = Group.find(params[:id]).users
      redirect_to(root_url) unless users.find(current_user)
  end
end
