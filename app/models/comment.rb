class Comment < ActiveRecord::Base
  attr_accessible :picture_id, :text, :user_id, :comment

  include ActsAsCommentable::Comment

  belongs_to :commentable, :polymorphic => true

  default_scope -> { order('created_at ASC') } #newest comments at the top

  # NOTE: install the acts_as_votable plugin if you
  # want user to vote on the quality of comments.
  #acts_as_voteable

  # NOTE: Comments belong to a user
  belongs_to :user

  belongs_to :picture
end
