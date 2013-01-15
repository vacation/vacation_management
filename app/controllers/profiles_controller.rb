class ProfilesController < ApplicationController
  def new
    if current_user
  	 @profile = Profile.new
    else 
      redirect_to log_in_path
    end
  end
  def create
  	@profile = Profile.new(params[:profile])
  	if @profile.save
      redirect_to profiles_path
    else
      render "new"
    end 		
  end
  def show
  	@profile = Profile.find(params[:id])
  	respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @profile }
    end
  end
  # def show
  #   @user = User.find(params[:id])
  #   @profile = Profile.where(:email => params[@user.email]).first
  #   respond_to do |format|
  #     if @profile
  #       format.html # show.html.erb
  #       format.json { head :no_content }
  #     else 
  #       redirect_to new_profile_path
  #     end
  #   end
  # end
  def index
    if current_user
    	@profiles = Profile.where(:email => current_user.email)
    	respond_to do |format|
  	    format.html  # index.html.erb
  	    format.json  { render :json => @profiles }
    	end
    else 
       redirect_to log_in_path
    end
  end

  def all
    if current_user && current_user.email == "admin@scilearn.com.cn"
       @profiles = Profile.all
      respond_to do |format|
        format.html  # all.html.erb
        format.json  { render :json => @profiles }
      end
    else 
       redirect_to log_in_path
    end

  end

def destroy
	  @profile = Profile.find(params[:id])
	  @profile.destroy
	 
	  respond_to do |format|
	    format.html { redirect_to profiles_path}
	    format.json { render :json => @profile}
	  end
end

def edit
  @profile = Profile.find(params[:id])
end

def update
  @profile = Profile.find(params[:id])

  respond_to do |format|
    if @profile.update_attributes(params[:profile])
      format.html {redirect_to profiles_path, notice: 'updated'}
      format.json {head :no_content}
    else
      format.html {render action:"edit"}
      format.json {render json: @profile.errors, status: :unprocessable_entity}
    end
  end
end

def show_profile_by_user

end
end
