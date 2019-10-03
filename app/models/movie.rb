class Movie < ApplicationRecord
  has_and_belongs_to_many :movie_lists
  has_many :user_ratings
end
