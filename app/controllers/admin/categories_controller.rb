class Admin::CategoriesController < ApplicationController

  #read the loggged in and admin user method before running the controller
  before_action :logged_in_user
  before_action :admin_user

  def new
    @category = Category.new
  end

    # Show all Category
  def index
    #@category = Category.all
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      flash[:success] = "Successfully Created Category" #saveが完了した時に画面に出る。
      redirect_to admin_categories_url
    else
      render 'new'
    end
  end

  def edit
    # Finding the specific Gcategory to EDIT
    @category = Category.find(params[:id])
  end
  
    # Button for Updating profile
  def update
    @category = Category.find(params[:id])

    if @category.update_attributes(category_params)
      # If successful UPDATE, this will happen
      flash[:success] = "Successfully Update" 
      redirect_to admin_categories_url
    else
      #  If user doesn't input anything, render Edit again
      render 'edit'
    end
  end

  def show
    @category = Category.new
  end

  def destroy
    @category = Category.find(params[:id])
    @category.delete
    flash[:success] = "Successfully deleted" 
    redirect_to admin_categories_url
  end
  
  private
  def category_params
    params.require(:category).permit(:title, :description)
  end
end
