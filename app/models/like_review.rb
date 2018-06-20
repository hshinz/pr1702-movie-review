class LikeReview < ApplicationRecord
  belongs_to :user
  belongs_to :review

  validates :review, uniqueness: {scope: :user}

  @like.notify :users, key: "like.notify"

  acts_as_notifiable :users,
    targets: -> (like_review, key) {
      ([review.movie.user] + review.movie.like_review_users.to_a - [review.user]).uniq
    },
  tracked: {only: [:create]}

end
