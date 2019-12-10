class RestaurantsController < ApplicationController
    before_action :find_restaurant, only: [:show, :edit, :update, :destroy]
    before_action :find_restaurant_aceptar, only: [:aceptar, :favorito]

    def index
        @restaurants = Restaurant.all.order("created_at DESC")
    end

    def show
      if @restaurant.comentarios.blank?
        @promedio_valoracion = 0
      else
        @promedio_valoracion = @restaurant.comentarios.average(:valoracion).round(2)
      end
    end

    def new
        @restaurant = current_user.restaurants.build
    end

    def create
        @restaurant = current_user.restaurants.build(restaurant_params)
        @restaurant.user_id = current_user.id
        @restaurant.aceptado = false
        @restaurant.fav = %w(86666)

        if @restaurant.save
            redirect_to root_path
        else
            render 'new'
        end
    end

    def edit
    end

    def update
        if @restaurant.update(restaurant_params)
            redirect_to restaurant_path(@restaurant)
        else
            render 'edit'
        end
    end

    def destroy
        @restaurant.destroy
        redirect_to root_path
    end

    def aceptar
        @restaurant.aceptado = true
        @restaurant.save
        redirect_to root_path
    end

    def favorito
        if @restaurant.fav.empty?
            @restaurant.fav.push(current_user.id.to_s)
            @restaurant.save
        elsif @restaurant.fav.exclude?(current_user.id.to_s)
            @restaurant.fav.push(current_user.id.to_s)
            @restaurant.save
        else
            @restaurant.fav.delete(current_user.id.to_s)
            @restaurant.save
            puts @restaurant.fav
        end
        redirect_to restaurant_path(@restaurant)
    end


    private

        def restaurant_params
            params.require(:restaurant).permit(:nombre, :correo, :direccion, :numero, :restaurant_img)
        end

        def find_restaurant
            @restaurant = Restaurant.find(params[:id])
        end

        def find_restaurant_aceptar
            @restaurant = Restaurant.find(params[:restaurant_id])
        end

end
