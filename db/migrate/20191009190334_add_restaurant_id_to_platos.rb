class AddRestaurantIdToPlatos < ActiveRecord::Migration[5.2]
  def change
    add_column :platos, :restaurant_id, :integer
    add_column :comentarios, :restaurant_id, :integer
  end
end
