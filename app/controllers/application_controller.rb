class ApplicationController < ActionController::Base
 # By default Helpers are only available to the VIEW, so we must let the Controller access it too
 include SessionsHelper

 #applicationControllerは、異なるcontroller間で使える。

 def logged_in_user　#logged_in_userメゾット
  unless signed_in?　#もしsigned_inしていなければ、
    flash[:danger] = "Please log in"　#flashメッセージが表示される。
    redirect_to signin_url　#signページに戻される。
  end     
 end

 def admin_user #admin_userメゾット
    unless current_user.admin?　#current_userがadminでなければ、
        flash[:danger] = "You are not authorized"　#失敗した場合にのみflashメッセージが表示される。
        redirect_to root_url　#root_urlに戻る。
    end   
 end
end
