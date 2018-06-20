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
  after_initialize :set_default_role

  scope :watchlists, ->{watchlists.order created_at: :desc}

  def has_movie? movie
    reviews.find_by movie: movie
  end

  def has_review? review
    like_reviews.find_by review: review
  end

  def has_watchlist? movie
    watchlists.find_by movie: movie
  end

  def set_default_role
    self.role ||= :user
  end
end
