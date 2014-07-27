class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :user_logged_in?
  
  private

  #Holding current user
  def current_user
    @current_user ||= User.find_by id: session[:user_id] if session[:user_id]
  end

  def sing_in
    session[:user_id] = user.id if logged_in?
  end

  #self explanatory
  def sing_out
    session[:user_id] = nil
    flash[:notice] = "Logged out!"
    redirect_to root_url
  end

  #checking for user
  def user_logged_in?
    current_user != nil
  end

  def user_logged_in!
    return if user_logged_in?
    flash[:alert] = "Please signn in to view this resource!"
    redirect_to root_url
  end
end
