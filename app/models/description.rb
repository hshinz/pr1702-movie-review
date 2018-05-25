class Description < ApplicationRecord
  validates :director_name, presence: true
  validates :cast_name, presence: true
  has_many :movies

  scope :description, ->{select(:director_name, :cast_name)}
end
