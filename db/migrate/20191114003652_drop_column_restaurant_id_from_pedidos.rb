class DropColumnRestaurantIdFromPedidos < ActiveRecord::Migration[5.2]
  def change
    remove_column :pedidos, :restaurant_id
  end
end
