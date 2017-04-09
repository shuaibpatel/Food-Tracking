class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
   private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end



 def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || home2_index_path
 end
 
 
 # Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
protect_from_forgery with: :exception
def after_sign_in_path_for(resource)
"/signedinuserprofile"
end

protect_from_forgery with: :exception
  helper_method :current_order

 def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end
end

