require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "教材比較.COM"
  end

  test "should get home" do
    get root_url
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "サイト概要 | #{@base_title}"
  end

  test "should get contact" do
    get contact_url
    assert_response :success
    assert_select "title", "コンタクト | #{@base_title}"
  end

end
