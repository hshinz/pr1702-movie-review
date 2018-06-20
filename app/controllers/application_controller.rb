class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :search
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to main_app.root_path, alert: exception.message
  end

  def search
    @search = Movie.ransack(params[:q])
  end

  def admin?
    current_user && current_user.admin?
  end

  def admin_only
    unless admin?
      flash[:alert] = t ".opp"
      redirect_to root_path
    end
  end
end
