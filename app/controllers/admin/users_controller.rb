class Admin::UsersController < ApplicationController
  before_action :admin_only
  before_action :find_user, only: [:show, :edit, :update, :destroy]

  def index
    @users = User.all
  end

  def show
  end

  def edit
  end

  def update
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path, flash[:success] = t(".update_success")
    else
      redirect_to admin_users_path, flash[:error] = t(".update_failed")
    end
  end

  def destroy
    if @user.destroy
    flash[:success] = t(".delete_success")
    redirect_to admin_users_path
    else
      flash[:alert] = t(".delete_failed")
    end
  end

private

  def find_user
    @user = User.find(params[:id])
    if @user.nil?
      flash[:alert] = t(".find_failed")
      redirect_to admin_users_path
    end
  end
end
