class AddUserIdToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :user_id, :integer
    add_index :microposts, :user_id
    add_foreign_key :microposts, :users, culumn: :user_id
  end
end
