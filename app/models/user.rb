class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable, :trackable, :confirmable
  has_many :interactives
  has_many :comments
  has_many :reviews
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum role: [:user, :admin]
end
