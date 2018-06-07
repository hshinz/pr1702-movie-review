class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user

  def show
    @reviews = @user.reviews.paginate page: params[:page], per_page: Settings.users.page
  end

  private

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless current_user == @user
  end
end
