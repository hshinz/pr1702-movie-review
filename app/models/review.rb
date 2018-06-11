class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :like_reviews, dependent: :destroy

  scope :sort_reviews, -> {all.sort_by(&:count_like_reviews).reverse}

  def count_like_reviews
    like_reviews.count
  end
end
