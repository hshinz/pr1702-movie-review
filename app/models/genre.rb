class Genre < ApplicationRecord
  has_many :movies
  validates :name, presence: true

  scope :genre, ->{select(:id, :name)}
end
