class PagesController < ApplicationController
  def home
    if signed_in?
      render 'users/dashboard'
    end
  end

  def about
  end
end
