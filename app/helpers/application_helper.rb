module ApplicationHelper

  def carro_has_items
    return @current_carro.placements.count > 0
  end

end
