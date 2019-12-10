# frozen_string_literal: true

class Admins::RegistrationsController < Devise::RegistrationsController
  include Accessible
  skip_before_action :check_user, except: [:new, :create]

  private
  
        def sign_up_params
          params.require(:admin).permit(:email, :password, :password_confirmation)
        end
  
        def account_update_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
end
