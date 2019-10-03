class CreateMovieLists < ActiveRecord::Migration[5.2]
  def change
    create_table :movie_lists do |t|
      t.string :name
      t.references :admin, foreign_key: { to_table: 'users' }
      t.timestamps
    end
  end
end
