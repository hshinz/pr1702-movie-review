class StaticPageController < ApplicationController
  def home
    @movies = Movie.paginate page: params[:page], per_page: Settings.movies.page

    @q = Movie.ransack(params[:q])
    @movies_search = @q.result(distinct: :true)
  end
end
