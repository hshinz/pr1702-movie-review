class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :search

  def search
    @q = Movie.ransack(params[:q])
  end
end
