require 'test_helper'

class StaticPagesControllerTest < ActionDispatch::IntegrationTest

  def setup
    @base_title = "教材比較.COM"
  end

  test "should get home" do
    get static_pages_home_url
    assert_response :success
    assert_select "title", @base_title
  end

  test "should get help" do
    get static_pages_help_url
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end

  test "should get about" do
    get static_pages_about_url
    assert_response :success
    assert_select "title", "サイト概要 | #{@base_title}"
  end

  test "should get contact" do
    get static_pages_contact_url
    assert_response :success
    assert_select "title", "コンタクト | #{@base_title}"
  end

end
