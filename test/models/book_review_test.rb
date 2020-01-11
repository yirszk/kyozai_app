require 'test_helper'

class BookReviewTest < ActiveSupport::TestCase
  
  def setup
    @user = users(:michael)
    @book_review = @user.book_reviews.build(content: "Lorem ipsum")
  end

  test "should be valid" do
    assert @book_review.valid?
  end

  test "user id should be present" do
    @book_review.user_id = nil
    assert_not @book_review.valid?
  end

  test "content should be present" do
    @book_review.content = " "
    assert_not @book_review.valid?
  end

  test "order should be most recent first" do
    assert_equal book_reviews(:most_recent), BookReview.first
  end
end
