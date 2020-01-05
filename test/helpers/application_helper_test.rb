require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "教材比較.COM"
    assert_equal full_title("ヘルプ"), "ヘルプ | 教材比較.COM"
  end
end