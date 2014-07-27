class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by_name(params[:name].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:notice] = "Jste příhlášen!"
      redirect_to root_url
    else
      flash.alert = "Něco je špatně."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash.notice = "Jste odhlášen."
    redirect_to root_url
  end
end
