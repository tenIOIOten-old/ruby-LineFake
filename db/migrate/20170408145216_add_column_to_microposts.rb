class AddColumnToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_reference :microposts, :user, foreign_key: true
  end
end
