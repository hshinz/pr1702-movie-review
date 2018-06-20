class StaticPageController < ApplicationController
  def home
    @newest = Movie.top_updated.first Settings.movies.limit
    @new_reviewes = Movie.top_reviewed.first Settings.movies.limit
    @top_rated = Movie.top_rated.first Settings.movies.limit
  end

  def search
    search_result = @search.result distinct: true
    @movies = search_result.paginate page: params[:page], per_page: Settings.movies.page
  end
end
