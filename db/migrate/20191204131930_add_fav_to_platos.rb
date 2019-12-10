class AddFavToPlatos < ActiveRecord::Migration[5.2]
  def change
    add_column :platos, :fav, :text, array: true, default: []
  end
end
