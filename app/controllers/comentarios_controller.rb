class ComentariosController < ApplicationController
  before_action :find_restaurant
  before_action :find_comentario, only: [:show, :edit, :update, :destroy]
  def index
    @comentarios = Comentario.all.order("created_at DESC")
  end

  def new
    @comentario = Comentario.new
  end

  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.restaurant_id = @restaurant.id
    @comentario.user_id = current_user.id

    if @comentario.save
      redirect_to restaurant_comentarios_path(@restaurant)
    else
      render 'new'
    end
  end


  def show
  end

  def edit
  end


  def update
    if @comentario.update(comentario_params)
      redirect_to restaurant_comentario_path(@comentario.restaurant_id, @comentario)
    else
      render 'edit'
    end
  end

  def destroy
    @comentario.destroy
    redirect_to restaurant_comentarios_path(@comentario.restaurant_id)
  end



  private

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def comentario_params
      params.require(:comentario).permit(:body, :valoracion)
    end

    def find_comentario
      @comentario = Comentario.find(params[:id])
    end


end
