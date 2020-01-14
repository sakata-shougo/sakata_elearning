class UsersController < ApplicationController
  def new
    @user = User.new
  end

  # Show all users
  def index
    # @users = User.all
    @users = User.paginate(page: params[:page], per_page: 10)
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

  def edit
    # Finding the specific user to EDIT
    @user = User.find(params[:id])
  end
  
  # Button for Updating profile
  def update
    @user = User.find(params[:id])

    if @user.update_attributes(users_params)
      # If successful UPDATE, this will happen
      flash[:success] = "Successfully Update" 
      redirect_to root_url# Goes to Profile
    else
      #  If user doesn't input anything, render Edit again
      render 'edit'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  
  
  private
    def users_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation,:avatar)
    end
  end