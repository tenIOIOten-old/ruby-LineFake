class AddFollowedIdAndFollowerIdToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_references :relationships, :follower, foreign_key: true
    add_references :relationships, :followed, foreign_key: true
    add_index :relationships, [:follower_id,:followed_id],unique: true
  end
end
