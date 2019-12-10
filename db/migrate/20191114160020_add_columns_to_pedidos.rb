class AddColumnsToPedidos < ActiveRecord::Migration[5.2]
  def change
    add_column :pedidos, :direccion, :string
    add_column :pedidos, :aclaraciones, :string 
  end
end
