class ApplicationController < ActionController::Base
 # By default Helpers are only available to the VIEW, so we must let the Controller access it too
 include SessionsHelper

 #applicationControllerは、異なるcontroller間で使える。


 #This function is to check whether the user is loggedin or not
 def logged_in_user
  unless signed_in?
    flash[:danger] = "Please log in"
    redirect_to signin_url
  end     
 end


#This function is to check whether the user is admin or not admin.
 def admin_user
  unless current_user.admin?
    flash[:danger] = "You are not authorized"
    redirect_to root_url
  end   
 end
end



