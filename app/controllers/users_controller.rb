class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to profiles_path, :notice => "Signed up!"
    else
      render "new"
    end
  end
  def show
    @user = User.find(params[:id])
    @profiles = Profile.where(:email => @user.email)
    respond_to do |format|
     if @profiles
        format.html # show.html.erb
        format.json { head :no_content }
       else 
        redirect_to new_profile_path
       end
     end
  end
end
