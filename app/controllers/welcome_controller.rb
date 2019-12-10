class WelcomeController < ApplicationController
  def index
    if params[:q].present?
      @restaurants = Restaurant.all.where("UPPER(nombre) LIKE UPPER(?) ", "%#{params[:q]}%")
    elsif params[:type].present?
      if params[:type] == "valorados"
        @restaurants = []
        @res_con = []
        @res_sin = []
        @restaurantes = Restaurant.all.order("created_at DESC")
        @restaurantes.each do |res|
          if not res.comentarios.blank?
            @res_con << res
          else
            @res_sin << res
          end
        end
        @var = 1
        while @var == 1
          @var = 0
          for i in (0..@res_con.length()-2)
            if @res_con[i].comentarios.average(:valoracion).round(2) > @res_con[i+1].comentarios.average(:valoracion).round(2)
              @aux = @res_con[i+1]
              @res_con[i+1] = @res_con[i]
              @res_con[i] = @aux
              @var = 0
            end
          end
        end
        @res_con.reverse.each do |res|
          @restaurants << res
        end
        @res_sin.each do |res|
          @restaurants << res
        end
      elsif params[:type] == "favoritos"
        @restaurantes = Restaurant.all.order("nombre ASC")
        @restaurants = []
        @restaurantes.each do |res|
          if res.fav.include?(current_user.id.to_s)
            @restaurants << res
          end
        end
      elsif params[:type] == "ascendente"
        @restaurants = Restaurant.all.order("nombre ASC")
      elsif params[:type] == "descendente"
        @restaurants = Restaurant.all.order("nombre DESC")
      end
    else
      @restaurants = Restaurant.all.order("nombre ASC")
    end
  end

  def vista
    @restaurants = Restaurant.all
  end

  def aceptar_rechazar
    @restaurants = Restaurant.all
  end
end
