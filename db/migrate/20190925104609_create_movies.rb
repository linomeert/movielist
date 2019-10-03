class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :year
      t.string :director
      t.text :cast
      t.integer :imdb_rating
      t.string :genre
      t.string :image
      t.boolean :watched, default: false
      t.string :imdb_link

      t.timestamps
    end
  end
end
