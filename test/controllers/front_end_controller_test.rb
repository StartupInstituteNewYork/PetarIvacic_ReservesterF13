require 'test_helper'

class FrontEndControllerTest < ActionController::TestCase
  test "should get rindex" do
    get :rindex
    assert_response :success
  end

end
