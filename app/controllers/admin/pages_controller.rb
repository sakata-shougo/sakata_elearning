class Admin::PagesController < ApplicationController
  before_action :logged_in_user　#ログインされる前に、applicationコントローラーにいって、メゾットを実行する
  before_action :admin_user　　　#アクションが実行される前に、applicationコントローラーのadmin_userを実行する。
  
  def home
  end
end
