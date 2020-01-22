class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def redirect_if_not_signed_in
  redirect_to root_path if !user_signed_in?
  end

  def redirect_if_signed_in
    redirect_to root_path if user_signed_in?
  end

  before_action :configure_permitted_parameters, if: :devise_controller?
  protected

  def configure_permitted_parameters
	#devise_parameter_sanitizer.for(:sign_up) { |u| u.permit( :name, 
         #                         				:email, 
         #                         				:password, 
          #                        				:password_confirmation)}

	devise_parameter_sanitizer.permit(:sign_up) do |user|
    	    user.permit( :name, 
                                  				:email, 
                                  				:password, 
                                  				:password_confirmation)
  	end

	devise_parameter_sanitizer.permit(:sign_in) do |user|
    	    user.permit( :email, :password)
  	end
	
	devise_parameter_sanitizer.permit(:account_update) do |user|
    	    user.permit( :name, 
                                 					 :email, 
                              					 	   :password, 
                                					  :password_confirmation, 
                                					 :current_password)
  	end
	
  end

end
