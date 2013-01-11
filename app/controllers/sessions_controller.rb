class SessionsController < ApplicationController
  def new
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
  def create
    #user = User.find_by_email(params[:email])
    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url, :notice => "logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
end
