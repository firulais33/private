class AddCarroIdToPlacements < ActiveRecord::Migration[5.2]
  def change
    add_column :placements, :carro_id, :integer
  end
end
