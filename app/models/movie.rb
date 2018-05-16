class Movie < ApplicationRecord
  belongs_to :genre
  has_many :descriptions
  has_many :interactives
  has_many :comments
  has_many :reviews
end
