class AddCantidadToPlacements < ActiveRecord::Migration[5.2]
  def change
    add_column :placements, :cantidad, :integer, default: 1
  end
end
