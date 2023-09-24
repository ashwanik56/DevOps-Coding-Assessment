class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
        # Successful login, set session and redirect or perform any other action
      else
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    end
  end
  class SessionsController < ApplicationController
    # Other actions ...
  
    def destroy
      # Log the user out by deleting their session data
      session.delete(:user_id) # Assuming you use :user_id as the session key
      flash[:success] = 'You have been successfully logged out.'
      redirect_to root_path
    end
  end
  class SessionsController < ApplicationController
    # Other actions...
  
    def destroy
      log_out
      redirect_to root_url, notice: 'Logged out successfully.'
    end
  end
    