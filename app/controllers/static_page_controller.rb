class StaticPageController < ApplicationController
  def home
    @movies = Movie.paginate page: params[:page], per_page: Settings.movies.page
  end
end
