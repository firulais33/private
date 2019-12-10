class PlacementsController < ApplicationController

  def index
    @placements = Placement.all.where({restaurant_id: params[:id], status: "Pendiente"})
  end

  def new
    @placement = Placement.new
  end

  def create
    plato = Plato.find(params[:plato_id])
    current_carro = @current_carro

    if current_carro.platos.include?(plato)
      @placement = current_carro.placements.find_by(:plato_id => plato)
      @placement.cantidad += 1
    else
      @placement = Placement.new
      @placement.carro = current_carro
      @placement.plato = plato
      #@placement.restaurant_id = plato.restaurant_id
    end

    if @placement.save!
      redirect_to carro_path(current_carro)
    else
      redirect_back fallback_location: root_path
    end
  end

  def destroy
    @placement = Placement.find(params[:id])
    @placement.destroy
    redirect_to carro_path(@current_carro)
  end

  def disminuir
    @placement = Placement.find(params[:id])
    if @placement.cantidad > 1
      @placement.cantidad -= 1
    else
      @placement = Placement.find(params[:id])
      @placement.destroy
      redirect_to carro_path(@current_carro)
      return
    end
    @placement.save
    redirect_to carro_path(@current_carro)
  end

  def aumentar
    @placement = Placement.find(params[:id])
    @placement.cantidad += 1
    @placement.save
    redirect_to carro_path(@current_carro)
  end

  def confirm
    @placement = Placement.find(params[:id])
    @placement.status = "Confirmado"
    @placement.save!
    redirect_to restaurant_placements_list_path(:id => @placement.restaurant_id)
  end

  def reject
    @placement = Placement.find(params[:id])
    @placement.status = "Rechazado"
    @placement.save!
    redirect_to restaurant_placements_list_path(:id => @placement.restaurant_id)
  end


  private
    def placement_params
      params.require(:placement).permit(:plato_id, :cantidad, :carro_id)
    end


end
