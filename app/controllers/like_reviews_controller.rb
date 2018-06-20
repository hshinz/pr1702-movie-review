class LikeReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    @like = current_user.like_reviews.build like_params
    if @like.save
      flash[:success] = t ".success"
      redirect_to @like.review.movie
    else
      flash[:danger] = t ".failed"
      redirect_to @like.review.movie
    end
  end

  private

  def like_params
    params.require(:like_review).permit :review_id
  end
end
