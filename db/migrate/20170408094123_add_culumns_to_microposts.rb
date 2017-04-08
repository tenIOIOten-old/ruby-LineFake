class AddCulumnsToMicroposts < ActiveRecord::Migration[5.0]
  def change
    add_column :microposts, :content, :string
    add_column :microposts, :repry,   :integer
  end
end
