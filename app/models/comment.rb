class Comment < ActiveRecord::Base
  attr_accessible :picture_id, :text, :user_id, :comment

  belongs_to :picture, :polymorphic => true

  default_scope -> { order('created_at DESC') } #newest comments at the top

  #Comments belong to a user
  belongs_to :user

end
