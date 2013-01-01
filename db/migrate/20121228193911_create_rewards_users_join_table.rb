class CreateRewardsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :rewards_users, :id => false do |t|
      t.integer :users_id
      t.integer :rewards_id
    end
  end
end
