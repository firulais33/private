class PedidosController < ApplicationController
  def index
    @pedidos = current_user.pedidos
    #@pedidos = Pedido.all
  end

  def show
    @pedido = Pedido.find(params[:id])
  end

  def new
    @pedido = Pedido.new
  end

  def create
    @pedido = Pedido.new(pedido_params)
    @pedido.precio_total = @current_carro.precio_total
    @current_carro.placements.each do |placement|
      @pedido.placements << placement

      @placement = Placement.find(placement.id)
      @placement.restaurant_id = placement.plato.restaurant_id
      @placement.direccion = @pedido.direccion
      @placement.aclaraciones = @pedido.aclaraciones
      @placement.save!
      #placement.cart_id = nil
    end
    @pedido.save!
    Carro.destroy(session[:carro_id])
    session[:carro_id] = nil
    redirect_to pedidos_path, notice: 'Tu pedido ha sido recibido. Puedes ver su estado en el listado de tus pedidos.'
  end

  private
    def pedido_params
      params.require(:pedido).permit(:user_id, :direccion, :aclaraciones)
    end
end
