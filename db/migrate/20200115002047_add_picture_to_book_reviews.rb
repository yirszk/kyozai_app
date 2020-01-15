class AddPictureToBookReviews < ActiveRecord::Migration[5.1]
  def change
    add_column :book_reviews, :picture, :string
  end
end
