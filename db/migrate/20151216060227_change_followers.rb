class ChangeFollowers < ActiveRecord::Migration
  def change
    rename_column :users, :followers, :followers_count
  end
end
