module CurrentPedido

  private

  def set_pedido
    @pedido = Pedido.find(session[:pedido_id])
  rescue ActiveRecord::RecordNotFound
    @pedido = Pedido.create
    session[:pedido_id] = @pedido.id
  end 

end
