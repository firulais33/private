class AddPrecioTotalToPedidos < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :precio_total, :integer
  end
end
