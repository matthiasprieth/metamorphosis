require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "comment_picture_user" do
  	comment = Comment.new(:picture_id => 1, :user_id => 1, :comment => 'Das ist ein Kommentar')
  	assert_equal 1, comment.user_id, comment.picture_id
  	assert_equal 'Das ist ein Kommentar', comment.comment
  end
end
