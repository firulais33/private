class DropColumnRestaurantIdFromPlacements < ActiveRecord::Migration[5.2]
  def change
    remove_column :placements, :restaurant_id
  end
end
