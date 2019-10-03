class AddStuffToRating < ActiveRecord::Migration[5.2]
  def change
    add_column :user_ratings, :rating, :integer
    add_column :user_ratings, :review, :text
  end
end
