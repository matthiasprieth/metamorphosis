class Comment < ActiveRecord::Base
  attr_accessible :picture_id, :text, :user_id
  belongs_to :picture
  belongs_to :user

end
