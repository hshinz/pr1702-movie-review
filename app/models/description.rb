class Description < ApplicationRecord
  belongs_to :movie, optional: true
  validates :director_name, presence: true
  validates :cast_name, presence: true
end
