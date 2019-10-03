class MovielistMovieJointTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :movie_lists, :movies do |t|
              t.index [:movie_list_id, :movie_id]
              t.index [:movie_id, :movie_list_id]
    end
  end
end
