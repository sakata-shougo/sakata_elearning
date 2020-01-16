class Admin::PagesController < ApplicationController

  #read the loggged in and admin user method before running the controller
  before_action :logged_in_user
  before_action :admin_user
  
  def home
  end

  def show
    @user = User.find(params[:id])
  end 
end
