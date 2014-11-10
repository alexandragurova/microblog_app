require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test "full title helper" do
    assert_equal full_title, "Microblog App"
    assert_equal full_title("Help"), "Help | Microblog App"
  end
end