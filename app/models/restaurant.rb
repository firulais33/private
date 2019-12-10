class Restaurant < ApplicationRecord
  has_many :platos
  has_many :comentarios
  has_many :coments
  has_many :placements
#<<<<<<< development
  belongs_to :user

  has_attached_file :restaurant_img, styles:{ root_path: "250x350>", restaurant_show: "300x450>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :restaurant_img, content_type: /\Aimage\/.*\z/
end
