class AddFavToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :fav, :text, array: true, default: []
  end
end
