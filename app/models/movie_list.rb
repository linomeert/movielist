class MovieList < ApplicationRecord
  has_and_belongs_to_many :users
  has_and_belongs_to_many :movies
  belongs_to :admin, class_name: User.name, foreign_key: "admin_id"

  validates :name, presence: true
end
