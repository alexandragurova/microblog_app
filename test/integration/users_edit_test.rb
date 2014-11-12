require 'test_helper'

class UsersEditTest < ActionDispatch::IntegrationTest
  
  def setup
    @user = users(:michael)
  end
  
  test "unsuccessful edit" do
    log_in_as(@user)
    get edit_user_path(@user)
    assert_template 'users/edit'
    patch user_path(@user), user: { name: "",
                                    email: "@invalid",
                                    password: "foo",
                                    passwors_confirmation: "bar" }
    assert_template 'users/edit'
  end
  
  test "successful edit" do
    get edit_user_path(@user)
    log_in_as(@user)
    assert_redirected_to edit_user_path(@user)
    name =  "Fo Bar"
    email = "foobar@valid.com"
    patch user_path(@user), user: { name: name,
                                    email: email,
                                    password: "",
                                    passwors_confirmation: "" }
    assert_not flash.empty?
    assert_redirected_to @user
    @user.reload
    assert_equal @user.name, name
    assert_equal @user.email, email
  end
end
