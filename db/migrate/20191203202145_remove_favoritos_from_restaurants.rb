class RemoveFavoritosFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :favoritos, :text
  end
end
