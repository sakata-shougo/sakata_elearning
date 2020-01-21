class Admin::WordsController < ApplicationController
  #read the loggged in and admin user method before running the controller
  before_action :logged_in_user
  before_action :admin_user
  #timesメゾットを使っている
  def new
    @category = Category.find(params[:category_id])
    @word = @category.words.build
    3.times {@word.choices.build}
  end

    # Show all Category
  def index
    #@word = Word.all
    @category= Category.find(params[:category_id])
    @words = @category.words.paginate(page: params[:page], per_page: 10)

  end
  
  def create
    @category= Category.find(params[:category_id])
    @word = @category.words.build(word_params)
    if @word.save
      flash[:success] = "Successfully Created Words" #saveが完了した時に画面に出る。
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end

  def edit
    @category= Category.find(params[:category_id])
    @word=Word.find(params[:id])
  end
  
  def update
    @category= Category.find(params[:category_id])
    @word=Word.find(params[:id])
    if @word.update(word_params)
      flash[:success] = "Successfully Created Word" #saveが完了した時に画面に出る。
      redirect_to admin_category_words_url
    else
      render 'new'
    end
  end

  def show
    @category = Category.new
  end

  def destroy
    @category= Category.find(params[:category_id])
    @word=Word.find(params[:id])
    @word.delete
    flash[:success] = "Successfully deleted" 
    redirect_to admin_category_words_url
  end
  
  private
    def word_params
      params.require(:word).permit(:content,choices_attributes: [:id,:content,:correct])
    end
end
