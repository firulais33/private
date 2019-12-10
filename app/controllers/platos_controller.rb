class PlatosController < ApplicationController
  before_action :find_restaurant
  before_action :find_plato, only: [:show, :edit, :update, :destroy]
  before_action :find_plato_fav, only: [:favorito]

  def index
    if params[:q].present?
      @platos = @restaurant.platos.where("UPPER(nombre) LIKE UPPER(?) ", "%#{params[:q]}%")
    elsif params[:type].present?
      if params[:type] == "valorados"
        @platos = []
        @platos_con = []
        @platos_sin = []
        @plats = @restaurant.platos.order("created_at DESC")
        @plats.each do |plato|
          if not plato.coments.blank?
            @platos_con << plato
          else
            @platos_sin << plato
          end
        end
        @var = 1
        while @var == 1
          @var = 0
          for i in (0..@platos_con.length()-2)
            if @platos_con[i].coments.average(:puntaje) > @platos_con[i+1].coments.average(:puntaje)
              @aux = @platos_con[i+1]
              @platos_con[i+1] = @platos_con[i]
              @platos_con[i] = @aux
              @var = 0
            end
          end
        end
        @platos_con.reverse.each do |plato|
          @platos << plato
        end
        @platos_sin.each do |plato|
          @platos << plato
        end
      elsif params[:type] == "ascendente"
        @platos = @restaurant.platos.order("nombre ASC")
      elsif params[:type] == "descendente"
        @platos = @restaurant.platos.order("nombre DESC")
      elsif params[:type] == "mayor-precio"
        @platos = @restaurant.platos.order("precio ASC")        
      elsif params[:type] == "menor-precio"
        @platos = @restaurant.platos.order("precio DESC")
      elsif params[:type] == "favoritos"
        @plats = @restaurant.platos.order("nombre ASC")
        @platos = []
        @plats.each do |plato|
          if plato.fav.include?(current_user.id.to_s)
            @platos << plato
          end
        end
      end
    else
      @platos = @restaurant.platos.order("nombre ASC")
    end
  end

  def show
    if @plato.coments.blank?
      @promedio_valoracion_p = 0
    else
      @promedio_valoracion_p = @plato.coments.average(:puntaje).round(2)
    end
  end

  def new
    @plato = Plato.new
  end

  def create
    @plato = Plato.new(plato_params)
    @plato.restaurant_id = @restaurant.id
    @plato.user_id = current_user.id

    if @plato.save
      redirect_to restaurant_platos_path(@restaurant)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @plato.update(plato_params)
      redirect_to restaurant_plato_path(@plato.restaurant_id, @plato)
    else
      render 'edit'
    end
  end

  def destroy
    @plato.destroy
    redirect_to restaurant_platos_path(@plato.restaurant_id)
  end

  def favorito
    if @plato.fav.empty?
        @plato.fav.push(current_user.id.to_s)
        @plato.save
    elsif @plato.fav.exclude?(current_user.id.to_s)
        @plato.fav.push(current_user.id.to_s)
        @plato.save
    else
        @plato.fav.delete(current_user.id.to_s)
        @plato.save
    end
    redirect_to restaurant_plato_path(@plato.restaurant_id, @plato)
end

  private

    def plato_params
      params.require(:plato).permit(:nombre, :precio, :descripcion, :cantidad_personas, :imagen, :valoracion, :plato_img)
    end

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_plato
      @plato = Plato.find(params[:id])
    end

    def find_plato_fav
      @plato = Plato.find(params[:plato_id])
    end

end
