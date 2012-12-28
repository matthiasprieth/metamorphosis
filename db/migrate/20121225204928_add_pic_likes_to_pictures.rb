class AddPicLikesToPictures < ActiveRecord::Migration
  def change
    add_column :pictures, :pic_likes, :integer
  end
end
