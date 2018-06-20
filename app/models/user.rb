class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :trackable, :confirmable
  has_many :interactives, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :like_reviews, dependent: :destroy
  has_many :watchlists, dependent: :destroy
  has_many :active_relationships, class_name: Relationship.name,
    foreign_key: :follower_id, dependent: :destroy
  has_many :passive_relationships, class_name: Relationship.name,
    foreign_key: :followed_id, dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  enum role: [:user, :admin]
  after_initialize :set_default_role

  scope :watchlists, ->{watchlists.order created_at: :desc}
  acts_as_target

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

  def follow other_user
    following << other_user
  end

  def unfollow other_user
    following.delete other_user
  end

  def following? other_user
    following.include? other_user
  end
end
