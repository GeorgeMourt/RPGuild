class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :opened_conversations_windows
  before_action :all_ordered_conversations
  before_action :configure_permitted_parameters, if: :devise_controller?
  def redirect_if_not_signed_in
  redirect_to root_path if !user_signed_in?
  end

  def redirect_if_signed_in
    redirect_to root_path if user_signed_in?
  end


  def opened_conversations_windows
  if user_signed_in?
    # opened conversations
    session[:private_conversations] ||= []
    session[:group_conversations] ||= []
    @private_conversations_windows = Private::Conversation.includes(:recipient, :messages)
                                         .find(session[:private_conversations])
    @group_conversations_windows = Group::Conversation.find(session[:group_conversations])
  else
    @private_conversations_windows = []
    @group_conversations_windows = []
  end
  end

  def all_ordered_conversations 
    if user_signed_in?
      @all_conversations = OrderConversationsService.new({user: current_user}).call
    end
  end

  
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
