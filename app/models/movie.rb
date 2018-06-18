class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :description, optional: true
  has_many :interactives
  has_many :comments
  has_many :reviews
  has_many :watchlists, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
  validates :synopsis, presence: true
  validates :release_date, presence: true
  validates :genre_id, presence: true

  scope :load_year, ->{select("release_date").map{ |i| i.release_date.year }.uniq}

  scope :genre, -> (genre_id) {where(genre_id: genre_id).order(created_at: :desc)}

  scope :release_year, -> (year) {(where "YEAR(release_date) = ?", year.to_i).order(created_at: :desc)}

  scope :user_rating, -> (user_rating) {joins(:reviews).where(reviews: {rating: user_rating}).order(created_at: :desc)}
end
