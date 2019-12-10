class CreatePlatos < ActiveRecord::Migration[5.2]
  def change
    create_table :platos do |t|
      t.string :nombre
      t.string :precio
      t.text :descripcion
      t.string :cantidad_personas
      t.string :imagen
      t.string :valoracion

      t.timestamps
    end
  end
end
