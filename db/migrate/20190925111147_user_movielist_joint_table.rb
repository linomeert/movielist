class UserMovielistJointTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :movie_lists do |t|
              t.index [:user_id, :movie_list_id]
              t.index [:movie_list_id, :user_id]
    end
  end
end
