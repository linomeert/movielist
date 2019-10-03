class UserRating < ApplicationRecord
  belongs_to :user
  belongs_to :movie

  validates :review, presence: true
  validates :rating, presence: true
end
