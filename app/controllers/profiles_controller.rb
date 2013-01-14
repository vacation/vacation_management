class ProfilesController < ApplicationController
  def new
  	@profile = Profile.new
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
  def index
  	@profiles = Profile.all
  	respond_to do |format|
	    format.html  # index.html.erb
	    format.json  { render :json => @profiles }
  	end
  end

def destroy
	  @profile = Profile.find(params[:id])
	  @profile.destroy
	 
	  respond_to do |format|
	    format.html { redirect_to profiles_path}
	    format.json { head :no_content}
	  end
end

def edit
  @profile = Profile.find(params[:id])
end

def update
  @profile = Profile.find(params[:id])

  respond_to do |format|
    if @profile.update_attributes(params[:profile])
      format.html {redirect_to @profile, notice: 'updated'}
      format.json {head :no_content}
    else
      format.html {render action:"edit"}
      format.json {render json: @profile.errors, status: :unprocessable_entity}
    end
  end
end
end
