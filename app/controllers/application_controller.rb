class ApplicationController < ActionController::Base
   
include Pundit

rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized


protected
   
    def user_not_authorized
        flash[:alert] = "Você não estar autorizado a executar essa ação."
        redirect_to(request.referrer || root_path)
    end




end
