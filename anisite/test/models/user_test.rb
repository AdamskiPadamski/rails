require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  
  test "no save without email" do
    user = User.new
    assert_not user.save
  end
  
  test "password length between 8 and 72" do
    user = User.new(email:"test",password:"testtest",password_confirmation:"testtest")
    assert user.save
  end
  
  test "password length incorrect" do
    user = User.new(email:"test",password:"t",password_confirmation:"t")
    assert_not user.save
  end
  
end
