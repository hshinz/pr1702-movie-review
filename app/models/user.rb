class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :trackable, :confirmable
  has_many :interactives
  has_many :comments
  has_many :reviews
  has_many :like_reviews, dependent: :destroy
  has_many :watchlists, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]

  def has_review? review
    like_reviews.find_by review: review
  end

  def has_watchlist? movie
    watchlists.find_by movie: movie
  end
end
