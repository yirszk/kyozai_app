class CreateBookReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :book_reviews do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :book_reviews, [:user_id, :created_at]
  end
end
