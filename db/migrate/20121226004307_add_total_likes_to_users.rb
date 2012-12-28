class AddTotalLikesToUsers < ActiveRecord::Migration
  def change
    add_column :users, :total_likes, :integer
  end
end
