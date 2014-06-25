class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?
  #this ensures these methods will work throuout the whole app

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  #here we set the @current_user variable, so that we don't have to litter our
  #code with 'if session[:user_id] everywhere'
  #
  #we 'memoize' this variable, so that we don't have to hit the db everytime
  #this '||=' method means "if @current_user exists, don't run the rest of this code"

  def logged_in?
    !!current_user #this '!!' ensures that it's gonna be a boolean
  end
  #here we just use the 'current_user' method and make a boolean value out of it
  #(for more logical presentation in the code)
end
