class CarrosController < ApplicationController
  def show
    @carro = @current_carro
  end

  def destroy
    @carro = @current_carro
    @carro.destroy
    session[:carro_id] = nil
    redirect_to root_path
  end
end
