class Plato < ApplicationRecord
  #validates :user_id, presence: true

  before_destroy :not_referenced_by_any_placement
  belongs_to :restaurant
  belongs_to :user
  has_many :coments


  has_attached_file :plato_img, styles: { plato_index: "250x350>", plato_show: "300x450>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :plato_img, content_type: /\Aimage\/.*\z/

  has_many :placements
  has_many :pedidos, :through => :placements

  private

    def not_referenced_by_any_placement
      unless placements.empty?
        errors.add(:base, 'Placement present')
        throw :abort
      end
    end
end
