class Carro < ApplicationRecord
  has_many :placements
  has_many :platos, through: :placements

  def sub_total
    placements.to_a.sum { |placement| placement.precio_total }
  end

  def precio_total
    sub_total.to_i #* (1 - descuento)
  end

end
