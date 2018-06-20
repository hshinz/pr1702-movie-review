class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :description, optional: true
  has_many :reviews, dependent: :destroy
  has_many :watchlists, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :image, :synopsis, :release_date, :genre_id, presence: true

  scope :top_updated, -> {order(created_at: :desc)}
  scope :top_reviewed, -> {joins(:reviews).uniq.sort}
  scope :top_rated, -> {joins(:reviews).where "reviews.rating > #{Settings.movies.rating.score}"}

  scope :top_by, -> (type) {
    case type
    when "top_updated"
      top_updated
    when "top_reviewed"
      top_reviewed
    when "top_rated"
      top_rated
    end
  }

  scope :load_year, ->{select("release_date").map{ |i| i.release_date.year }.uniq}
  scope :genre, -> (genre_id) {where(genre_id: genre_id).order(created_at: :desc)}
  scope :release_year, -> (year) {(where "YEAR(release_date) = ?", year.to_i).order(created_at: :desc)}
  scope :user_rating, -> (user_rating) {joins(:reviews).where(reviews: {rating: user_rating}).order(created_at: :desc)}

  def count_reviews
    reviews.count
  end
end
