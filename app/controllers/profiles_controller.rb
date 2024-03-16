class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destory]
  def index
  end

  def show

  end

  def new 
  end

  def edit 
    
  end

  def update
    puts profile_params
    if(@profile.update(profile_params))
      redirect_to unauthenticated_root_path, notice: 'Profile was successfully updated'      
    else
      puts ' cannot update ' 
      render 'pages/home', alert: 'Profile cannot be updated'
    end
  end

  def destory

  end

  
  private 
  def set_profile
    @profile = User.find(params[:id])
  end

  def profile_params
    params.require(:user).permit(:name, :bio, :overview, :role, address_attributes: [:id, :country_name, :city_name], social_links_attributes: [:id, :icon, :link])
  end
end
