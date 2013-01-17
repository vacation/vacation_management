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
    #profile = Profile.find_by_email(params[:email])
    
    if user && (user.approved || user.email == "admin@scilearn.com.cn")
      session[:user_id] = user.id
      respond_to do |format|
        format.html { redirect_to profiles_path}
        format.json { render :json => @index}
      end
    elsif user
      flash.now.alert = "Please wait to approval!"
      render "new"
    else
      flash.now.alert = "Invalied email or password!"
    end
  end

   
end
