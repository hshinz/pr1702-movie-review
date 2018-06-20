class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :load_user

  def show
    @reviews = @user.reviews.paginate page: params[:page], per_page: Settings.users.page
    @watchlists = @user.watchlists
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user
  end
end
