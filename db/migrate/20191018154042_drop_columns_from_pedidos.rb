class DropColumnsFromPedidos < ActiveRecord::Migration[5.2]
  def change
    remove_column :pedidos, :numero
    remove_column :pedidos, :descripcion
    remove_column :pedidos, :date
  end
end
