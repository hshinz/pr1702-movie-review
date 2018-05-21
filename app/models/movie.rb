class Movie < ApplicationRecord
  belongs_to :genre
  belongs_to :description, optional: true
  has_many :interactives
  has_many :comments
  has_many :reviews
  validates :name, presence: true
  validates :image, presence: true
  validates :synopsis, presence: true
  validates :release_date, presence: true
  validates :genre_id, presence: true
end
