class AddColumnStatusToPlacements < ActiveRecord::Migration[5.2]
  def change
    add_column :placements, :status, :string, :default => "Pendiente"
  end
end
