require 'test_helper'

class AboutControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "should get default" do
    get :default
    assert_response :success
  end
  
end
