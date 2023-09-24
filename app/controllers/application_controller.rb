class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
  
    # Other code...
  
    private
  
    # Log out the current user by clearing their session
    def log_out
      session.delete(:user_id) # Assuming you use :user_id as the session key
    end
  
    # Check if a user is logged in
    def logged_in?
      !session[:user_id].nil? # Assuming you use :user_id as the session key
    end
  
    # Define a helper method to access logged_in? in views
    helper_method :logged_in?
  end
    