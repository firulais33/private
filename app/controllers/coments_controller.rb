class ComentsController < ApplicationController
  before_action :find_restaurant
  before_action :find_plato
  before_action :find_coment, only: [:show, :edit, :update, :destroy]
  def index
    @coment = Coment.all.order("created_at DESC")
  end

  def new
    @coment = Coment.new
  end

  def create
    @coment = Coment.new(coment_params)
    @coment.restaurant_id = @restaurant.id
    @coment.plato_id = @plato.id
    @coment.user_id = current_user.id

    if @coment.save
      redirect_to restaurant_plato_coments_path(@restaurant, @plato)
    else
      render 'new'
    end
  end


  def show
  end

  def edit
  end


  def update
    if @coment.update(coment_params)
      redirect_to restaurant_plato_coment_path(@coment.restaurant_id, @coment.plato_id, @coment)
    else
      render 'edit'
    end
  end

  def destroy
    @coment.destroy
    redirect_to restaurant_plato_coments_path(@coment.restaurant_id, @coment.plato_id)
  end



  private

    def find_restaurant
      @restaurant = Restaurant.find(params[:restaurant_id])
    end

    def find_plato
      @plato = Plato.find(params[:plato_id])
    end

    def coment_params
      params.require(:coment).permit(:body, :puntaje)
    end

    def find_coment
      @coment = Coment.find(params[:id])
    end


end
