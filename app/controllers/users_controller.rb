class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def status_update
    @user = User.find(params[:user_status][:user_id])
    @status_update = @user.user_statuses.new
    @status_update.status = params[:user_status][:status]
    @status_update.save
    redirect_to root_path
  end

  def status_like
    @status_like = StatusLike.create(:user_id=>current_user.id, :user_status_id=>params[:id])
    redirect_to root_path
  end

  def unlike_status
    unlike_status = StatusLike.where(:user_id=>current_user.id, :user_status_id=>params[:id]).last
    unlike_status.destroy
    redirect_to root_path
  end
end