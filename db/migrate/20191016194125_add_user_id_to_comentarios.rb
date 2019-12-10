class AddUserIdToComentarios < ActiveRecord::Migration[5.2]
  def change
    add_column :comentarios, :user_id, :integer
  end
end
