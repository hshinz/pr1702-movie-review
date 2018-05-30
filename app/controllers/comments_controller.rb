class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :load_comment, only: [:edit, :update]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new comment_params
    if @comment.save
      flash[:success] = t ".created"
      redirect_to @comment.movie
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find params[:id]
  end

  def update
    @comment = Comment.find params[:id]
    if @comment = Comment.update_attributes(comment_params)
      flash[:success] = t ".updated"
      redirect_to @comment.movie
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
    flash[:success] = t ".destroyed"
    redirect_to @comment.movie
  end

  private

  def comment_params
    params.require(:comment).permit :user_id, :movie_id, :content
  end

  def load_comment
    @comment = Comment.find_by id: params[:id]
    redirect_to movies_path unless @comment
  end
end
