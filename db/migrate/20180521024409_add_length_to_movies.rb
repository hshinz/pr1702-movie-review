class AddLengthToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :length, :time
  end
end
