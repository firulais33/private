class Placement < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :carro, optional: true
  belongs_to :plato


  def precio_total
    plato.precio.to_i * cantidad.to_i
  end
end
