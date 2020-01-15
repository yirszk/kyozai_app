class BookReviewsController < ApplicationController
    before_action :logged_in_user, only: [:create, :destroy]
    before_action :correct_user, only: :destroy

  def create
    @book_review = current_user.book_reviews.build(book_reviews_params)
    if @book_review.save
        flash[:success] = "書評が投稿されました！"
        redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def destroy
    @book_review.destroy
    flash[:success] = "書評が削除されました。"
    redirect_to request.referrer || root_url
  end

  private

    def book_reviews_params
        params.require(:book_review).permit(:content, :picture)
    end

    def correct_user
      @book_review = current_user.book_reviews.find_by(id: params[:id])
      redirect_to root_url if @book_review.nil?
    end
end