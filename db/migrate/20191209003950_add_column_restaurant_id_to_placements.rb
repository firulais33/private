class AddColumnRestaurantIdToPlacements < ActiveRecord::Migration[5.2]
  def change
    add_column :placements, :restaurant_id, :integer
  end
end
