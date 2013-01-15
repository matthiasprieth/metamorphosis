require 'test_helper'

class PictureTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "picture_name_user_desc" do
  	pic = Picture.new(:name => 'Testbild1', :user_id => 1, :description => 'cooles Bild!')
  	assert_equal "Testbild1", pic.name
  	assert_equal 1, pic.user_id
  	assert_equal "cooles Bild!", pic.description
  end

  test "picture_likes_default_value" do
  	pic = Picture.new(:name => 'Testbild1', :user_id => 1, :description => 'cooles Bild!')
  	assert_equal 0, pic.pic_likes
  end
end
