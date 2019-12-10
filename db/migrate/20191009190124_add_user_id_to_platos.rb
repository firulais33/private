class AddUserIdToPlatos < ActiveRecord::Migration[5.2]
  def change
    add_column :platos, :user_id, :integer
  end
end
