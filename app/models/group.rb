class Group < ApplicationRecord
  has_and_belongs_to_many :users, join_table: :groups_users
  has_many :group_contents, dependent: :destroy
end
