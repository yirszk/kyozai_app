require 'test_helper'

class BookReviewsControllerTest < ActionDispatch::IntegrationTest
  
  def setup
    @book_review = book_reviews(:orange)
  end

  test "should redirect create when not logged in" do
    assert_no_difference 'BookReview.count' do
      post book_reviews_path, params: { book_reviews: { content: "Lorem ipsum" } }
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy when not logged in" do
    assert_no_difference 'BookReview.count' do
      delete book_review_path(@book_review)
    end
    assert_redirected_to login_url
  end

  test "should redirect destroy for wrong book review" do
    log_in_as(users(:michael))
    book_review = book_reviews(:ants)
    assert_no_difference 'BookReview.count' do
      delete book_review_path(book_review)
    end
    assert_redirected_to root_url
  end
end