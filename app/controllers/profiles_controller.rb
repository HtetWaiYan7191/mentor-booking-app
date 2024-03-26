class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destory]
  def index
  end

  def show

  end

  def new 
  end

  def create
  end

  def edit 
    @social_links = @profile.social_links
  end

  def update
    puts 'profile update'
    if(@profile.update(profile_params))
      redirect_to unauthenticated_root_path, notice: 'Profile was successfully updated'      
    else
      puts ' cannot update ' 
      puts @profile.errors.full_messages
      redirect_to unauthenticated_root_path, alert: 'Profile cannot updated'      
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
