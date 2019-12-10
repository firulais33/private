class RemoveListaFavoritosFromRestaurants < ActiveRecord::Migration[5.2]
  def change
    remove_column :restaurants, :listafavoritos, :text
  end
end
