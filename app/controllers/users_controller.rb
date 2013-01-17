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

  def index
    @users = User.all
    if @users
      respond_to do |format|
        format.html  # all.html.erb
        format.json  { render :json => @users }
      end
    end
  end

  def edit

  end
  # put
  # /users/1/approval
  def approval
  @user = User.find(params[:id])

  respond_to do |format|
    if @user.update_attribute("approved", "true")
      format.js { render :json => {:result =>"success111" , :user_id => @user.id.to_s},:layout => false, :status=>200}
    else
      format.js { render :json => {:result =>"error111" , :user_id => @user.id.to_s},:layout => false, :status=>500}
    end
  end
end
end
