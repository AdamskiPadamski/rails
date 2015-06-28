require 'test_helper'

class LoginsControllerTest < ActionController::TestCase
  
  def setup
    @user = users(:one)
  end
  
  test "should get new" do
    get :new
    assert_response :success
    assert_nil assigns(:logins)
    assert_template 'new'
  end
  
  test "should create login instance" do
    assert_not_equal(session[:user_id],@user.id) ## user_id should not be set at this point
    get(:create, :session => {email:'User_1_e', password:'User_1_p'}) ## Note: Valid credentials as defined in setup therefore should pass
    assert_equal(session[:user_id],@user.id) ## user_id should now be set
    assert_response :redirect
    assert_redirected_to @user
  end
  
  test "should not create login instance (email error)" do
    assert_not_equal(session[:user_id],@user.id)
    get(:create, :session => {email:'', password:'User_1_p'}) ## Note: Email "''" not in database therefore should be invalid
    assert_not_equal(session[:user_id],@user.id)
    assert_response :success
    assert_template 'new'
  end
  
  test "should not create login instance (password error)" do
    assert_not_equal(session[:user_id],@user.id)
    get(:create, :session => {email:'User_1_e', password:''}) ## Note: Incorrect password therefore should be invalid
    assert_not_equal(session[:user_id],@user.id)
    assert_response :success
    assert_template 'new'
  end
  
  test "should log out (user logged in)" do
    get(:create, :session => {email:'User_1_e', password:'User_1_p'}) ## Log in a user successfully
    get :destroy
    assert_response :redirect
    assert_redirected_to root_path
  end
  
  test "should 'log out' (no user logged in)" do
    get :destroy
    assert_response :redirect
    assert_redirected_to root_path
  end

end
