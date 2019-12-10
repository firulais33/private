class CreatePlacements < ActiveRecord::Migration[5.2]
  def change
    create_table :placements do |t|
      t.references :pedido, foreign_key: true
      t.references :plato, foreign_key: true

      t.timestamps
    end
  end
end
