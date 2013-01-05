require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "username_email" do
  	user = User.new(:username => 'Manuel Mitterer', :email => 'meinetestmail@tester.com')
  	assert_equal "Manuel Mitterer", user.username
  	assert_equal "meinetestmail@tester.com", user.email
  end
end
