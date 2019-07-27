class AddUserIdToRules < ActiveRecord::Migration[5.2]
  def change
    add_column :rules, :user_id, :integer
    add_column :rules, :likes_count, :integer
  end
end
