class AddFollowedIdAndFollowerIdToRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :relationships, :follower, foreign_key: :user
    add_reference :relationships, :followed, foreign_key: :user
    add_index :relationships, [:follower_id,:followed_id],unique: true
  end
end
