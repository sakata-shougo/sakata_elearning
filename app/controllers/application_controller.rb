class ApplicationController < ActionController::Base
 # By default Helpers are only available to the VIEW, so we must let the Controller access it too
 include SessionsHelper

 #applicationControllerは、異なるcontroller間で使える。

 def logged_in_user　#
  unless signed_in?
    flash[:danger] = "Please log in"
    redirect_to signin_url
  end     
 end



 def admin_user #
    unless current_user.admin?
        flash[:danger] = "You are not authorized"
        redirect_to root_url
    end   
 end
end
