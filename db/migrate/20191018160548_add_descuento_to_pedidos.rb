class AddDescuentoToPedidos < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :descuento, :integer, default: 0
  end
end
