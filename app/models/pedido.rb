class Pedido < ApplicationRecord
  belongs_to :user

  has_many :placements, dependent: :destroy
  has_many :platos, :through => :placements

  def sub_total
    placements.to_a.sum { |placement| placement.precio_total }
  end

  def precio_total
    sub_total.to_i * (1 - descuento.to_i)
  end

end
