class CreateLikeReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :like_reviews do |t|
      t.integer :user_id
      t.integer :review_id

      t.timestamps
    end

    add_index :like_reviews, [:review_id, :user_id], unique: true
  end
end
