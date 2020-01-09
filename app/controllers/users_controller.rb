class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def create
      @user = User.new(users_params)
      if @user.save
        flash[:success] = "Welcome to Sakata Elearning System" #saveが完了した時に画面に出る。
        redirect_to root_url
      else
        render 'new'
      end
    end
  
    private
      def users_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
      end
    
    def login
    end
  end