class LikeReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @like = LikeReview.new
  end

  def create
    @like = current_user.like_reviews.build like_params
    if @like.save
      flash[:success] = "success"
      redirect_to @like.review.movie
    else
      flash[:danger] = "failed"
      render :new
    end
  end

  private

  def like_params
    params.permit :review_id
  end
end
