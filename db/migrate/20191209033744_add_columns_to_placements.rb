class AddColumnsToPlacements < ActiveRecord::Migration[5.2]
  def change
    add_column :placements, :direccion, :string
    add_column :placements, :aclaraciones, :string, :default => "empty"
  end
end
