class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by username: params[:username]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id  #this is the tricky part
                  #what we do here, is we save the 'user.id' value and store it
                  #in the session (under ':user_id' key). Now as long as we have
                  #a value there, that means we're logged in (and that determines
                  #who's (which user) logged in)

                  #check application_controller.rb to check helper methods to this
      
      flash[:notice] = "You Have Logged In"
      redirect_to user_path(user.username)
    else
      flash.now[:notice] = "Wrong Username or Password" #change the look of this
      render 'new'

      #alterantive approach might be
      #flash[:notice] = "Wrong Username or Password" #note how this is just a usual flash
      #redirect_to login_path #with redirects we can't store the values from the 'session' hash
    end
  end

  def destroy
    session[:user_id] = nil #TODO map a route to this action and a logout button or sth
          #here when we log out, we need to set this value to nil (so noone's logged in)
    flash[:notice] = "You Have Logged Out"
    redirect_to login_path
  end
end