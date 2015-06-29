require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:user)
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { email: @user.email, first_name: @user.first_name, password: 'testtest', password_confirmation: 'testtest', surname: @user.surname }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user and their anime" do
    get :show, id: @user
    assert_response :success
    assert_not_nil assigns(:animesseen)
  end

  test "should get edit if signed in user is equal to user trying to update" do
    session[:user_id] = @user.id
    get :edit, id: @user
    assert_response :success
    assert_template 'edit'
  end
  
  test "should not get edit if signed in user is not equal to user trying to update" do
    session[:user_id] = @user.id + 1
    get :edit, id: @user
    assert_response :forbidden
  end

  test "should update user" do
    patch :update, id: @user, user: { email: @user.email, first_name: @user.first_name, password: 'testtest', password_confirmation: 'testtest', surname: @user.surname }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
