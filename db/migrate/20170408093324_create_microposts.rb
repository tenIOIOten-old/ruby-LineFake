class CreateMicroposts < ActiveRecord::Migration[5.0]
  def change
    create_table :microposts do |t|

      t.timestamps
    end
  end
end
