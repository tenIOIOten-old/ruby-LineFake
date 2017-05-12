class AddFollowedIdAndFollowerIdToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_column :relationships, :follower_id, :integer, foreign_key: true, index: true
    add_column :relationships, :followed_id, :integer, foreign_key: true, index: true
    add_index :relationships, [:follower_id,:followed_id],unique: true
  end
end
