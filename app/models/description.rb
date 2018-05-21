class Description < ApplicationRecord
  validates :director_name, presence: true
  validates :cast_name, presence: true
end
