class SessionsController < ApplicationController
  def new
    # This is for the Login/Signin form
  end
  
  def create
    # Check if email exists in our database
    # Check if password is correct for that email
    user = User.find_by(email: params[:session][:email])
      
    if user && user.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page
      sign_in user
      redirect_to root_url
    else
      # Create an error message and re-render the signin form
      redirect_to signin_url
      # render 'new'
      end
    end
  
    def destroy
      sign_out
      redirect_to root_url
    end
end
