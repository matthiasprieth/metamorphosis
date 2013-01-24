class AddDefaultValues < ActiveRecord::Migration
  def up
  	change_column  :users, :profil_pic, :string
	change_column  :users, :total_likes, :integer, :default => 0
	change_column  :pictures, :pic_likes, :integer, :default => 0

	add_index :comments, :picture_id
	add_index :pictures, :user_id

	add_index :rewards_users, :users_id
	add_index :rewards_users, :rewards_id
  end

  def down
  	
  end
end
