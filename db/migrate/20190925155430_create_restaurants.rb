class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :nombre
      t.string :correo
      t.string :direccion
      #t.float :valoracion
      t.string :numero

      t.timestamps null: false 
    end
  end
end
