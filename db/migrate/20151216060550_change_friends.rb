class ChangeFriends < ActiveRecord::Migration
  def change
    rename_column :users, :friends, :friends_count
  end
end
