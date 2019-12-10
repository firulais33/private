class CreateCarros < ActiveRecord::Migration[5.2]
  def change
    create_table :carros do |t|

      t.timestamps
    end
  end
end
