class User < ApplicationRecord
  has_many :platos
  has_many :comentarios
  has_many :coments
#<<<<<<< development
  has_many :restaurants

#=======

  has_many :pedidos, dependent: :destroy
  has_many :platos
#>>>>>>> master
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def pedido
    @pedido = Pedido.where(user_id: self.id)
  end
end
