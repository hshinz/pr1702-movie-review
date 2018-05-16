class CreateMovies < ActiveRecord::Migration[5.0]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image
      t.string :trailer
      t.text :synopsis
      t.date :release_date
      t.integer :genre_id
      t.integer :description_id

      t.timestamps
    end
  end
end
