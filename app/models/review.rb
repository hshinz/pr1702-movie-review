class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :like_reviews, dependent: :destroy
  has_many :like_review_users, source: :user
  validates :rating, presence: true

  scope :sort_reviews, -> {all.sort_by(&:count_like_reviews).reverse}

  def count_like_reviews
    like_reviews.count
  end

  def like_review_users
    User.where(:id.in => like_reviews.pluck(:user_id))
  end
end
