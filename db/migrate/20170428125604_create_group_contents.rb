class CreateGroupContents < ActiveRecord::Migration[5.0]
  def change
    create_table :group_contents do |t|
      t.references :group, foreign_key: true
      t.references :user, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
