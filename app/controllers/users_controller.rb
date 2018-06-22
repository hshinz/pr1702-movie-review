class UsersController < ApplicationController
  before_action :load_user, :load_reviews

  def show
    @watchlists = @user.watchlists
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t ".not_found"
    redirect_to root_url
  end

  def load_reviews
    @reviews = @user.reviews.paginate page: params[:page], per_page: Settings.users.page
  end
end
