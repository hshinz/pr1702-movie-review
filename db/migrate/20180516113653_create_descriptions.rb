class CreateDescriptions < ActiveRecord::Migration[5.0]
  def change
    create_table :descriptions do |t|
      t.string :director_name
      t.string :cast_name

      t.timestamps
    end
  end
end
