class Genre < ApplicationRecord
  has_many :movies
  validates :name, presence: true, uniqueness: {case_sensitive: false}

  before_save :capitalize_name

  scope :load_data, ->{select(:id, :name)}

  private

  def capitalize_name
    self.name.capitalize!
  end
end
