class HomeController < ApplicationController
  def index
    @users = User.all
    @user = current_user
    @user_status = @user.user_statuses.build if @user
  end
end
