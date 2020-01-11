require 'test_helper'

class BookReviewsInterfaceTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end

  test "book review interface" do
    log_in_as(@user)
    get root_path
    assert_select 'div.pagination'
    # 無効な送信
    assert_no_difference 'BookReview.count' do
      post book_reviews_path, params: { book_review: { content: ''}}
    end
    assert_select 'div#error_explanation'
    # 有効な送信
    content = "This book is worth reading"
    assert_difference 'BookReview.count', 1 do
      post book_reviews_path, params: { book_review: { content: content } }
    end
    assert_redirected_to root_url
    follow_redirect!
    assert_match content, response.body
    # 投稿を削除する
    assert_select 'a', text: '削除'
    first_book_review = @user.book_reviews.paginate(page: 1).first
    assert_difference 'BookReview.count', -1 do
      delete book_review_path(first_book_review)
    end
    # 違うユーザーのプロフィールに削除リンクが無いことを確認
    get user_path(users(:archer))
    assert_select 'a', text: '削除', count: 0
  end
end
