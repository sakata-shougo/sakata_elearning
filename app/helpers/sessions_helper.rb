module SessionsHelper
      
    # Lets users sign in, session is stored in db
  def sign_in(user)
    session[:user_id] = user.id
  end

  # Deleting the session and user_id in db
  def sign_out
    session.delete(:user_id)
  end

  # Defining who is currently logged in
  def current_user
    User.find_by(id: session[:user_id])
    # takes coordination between your user’s browser and your Rails app to make everything connect up
    # it all starts with cookies
  end

  # Asking Rails on if user is signed in
  def signed_in?
    !current_user.nil?
    # Rails will check if the user is nil/null
    # Rails will check if there is no user (user is empty)
  end
end
