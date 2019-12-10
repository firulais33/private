class Coment < ApplicationRecord
  belongs_to :plato
  belongs_to :restaurant
  belongs_to :user
end
