class AddAceptadoToRestaurants < ActiveRecord::Migration[5.2]
  def change
    add_column :restaurants, :aceptado, :boolean
  end
end
