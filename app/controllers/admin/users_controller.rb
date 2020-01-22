class Admin::UsersController < ApplicationController

  #read the loggged in and admin user method before running the controller
  before_action :logged_in_user
  before_action :admin_user
  

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def update
    @user=User.find(params[:id])
    @user.update(admin: true)

    redirect_to admin_users_url
  end

  def destroy
    @user= User.find(params[:id])
    @user.update(admin: false)

    redirect_to admin_users_url
  end

end
