class StaticPageController < ApplicationController
  def home
    @newest = Movie.top_updated.first Settings.movies.limit
    @new_reviewes = Movie.top_reviewed.first Settings.movies.limit
    @top_rated = Movie.top_rated.first Settings.movies.limit
  end
end
