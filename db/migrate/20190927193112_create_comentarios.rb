class CreateComentarios < ActiveRecord::Migration[5.2]
  def change
    create_table :comentarios do |t|
      t.string :body
      t.integer :valoracion

      t.timestamps null: false
    end
  end
end
