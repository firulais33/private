class AddListaFavoritosToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :listafavoritos, :text, array: true, default: []
  end
end
