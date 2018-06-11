class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :search

  def search
    @q = Movie.ransack(params[:q])
  end
  before_action :authenticate_user!

  def admin?
    current_user && current_user.admin?
  end

  def admin_only
    unless admin?
      flash[:alert] = "You dont have authorized access to this action"
      redirect_to root_path
    end
  end
end
