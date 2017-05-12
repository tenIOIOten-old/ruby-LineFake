class AddFollowedIdAndFollowerIdToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_culumn :follower_id, :relationships, foreign_key: true, index: true
    add_culumn :followed, :relationships, foreign_key: true, index: true
    add_index :relationships, [:follower_id,:followed_id],unique: true
  end
end
