class ApplicationController < ActionController::Base
  before_action :current_carro

  def after_sign_in_path_for(resource)
    root_path
  end

  private
    def current_carro
      if session[:carro_id]
        carro = Carro.find_by(:id => session[:carro_id])
        if carro.present?
          @current_carro = carro
        else
          session[:carro_id] = nil
        end
      end

      if session[:carro_id] == nil 
        @current_carro = Carro.create
        session[:carro_id] = @current_carro.id
      end
    end
end
