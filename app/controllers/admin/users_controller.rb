class Admin::UsersController < ApplicationController
  before_action :admin_only
  def index
    @users = User.all
  end

  def destroy
    @user = User.find_by id: params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admin_users_path
  end
end
