class CreateRalationships < ActiveRecord::Migration[5.0]
  def change
    create_table :ralationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end
    add_index :ralationships, :follower_id
    add_index :ralationships, :followed_id
    add_index :ralationships, [:follower_id, :followed_id], unique:true
  end
end
