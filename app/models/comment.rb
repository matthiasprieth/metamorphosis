class Comment < ActiveRecord::Base
  attr_accessible :picture_id, :user_id, :comment

  belongs_to :picture, :polymorphic => true

  validates_presence_of :comment

  default_scope -> { order('created_at DESC') } #newest comments at the top

  #Comments belong to a user
  belongs_to :user

end
