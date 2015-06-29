require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should get default" do
    get :default
    assert_response :success
  end
  
end
