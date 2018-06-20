class WatchlistsController < ApplicationController
  before_action :authenticate_user!

  def create
    @add_watchlist = current_user.watchlists.build watchlist_params
    if @add_watchlist.save
      flash[:success] = t ".added"
      redirect_to @add_watchlist.movie
    else
      flash[:danger] = t ".failed"
      redirect_to @add_watchlist.movie
    end
  end

  def destroy
    @watchlist = Watchlist.find_by id: params[:id]
    if @watchlist.nil?
      redirect_to root_url
    else
      @watchlist.destroy ? flash[:success] = t(".remove") : flash[:danger] = t(".failed")
      redirect_to @watchlist.user
    end
  end

  private

  def watchlist_params
    params.require(:watchlist).permit :movie_id
  end
end
