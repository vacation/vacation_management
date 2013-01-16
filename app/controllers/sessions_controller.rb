class SessionsController < ApplicationController
  def new
    if session[:user_id]
      redirect_to User.find(session[:user_id]), :notice => "logged in!"
    end
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
      redirect_to user, :notice => "logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end
end
