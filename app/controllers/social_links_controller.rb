class SocialLinksController < ApplicationController
  before_action :set_social_link, only: [:destroy]
  def new
  end

  def create
    @social_link = SocialLink.new(social_link_params)
    puts ' social link created '
    if @social_link.save
      flash[:notice] = "Social link added successfully"
      redirect_to edit_profile_path(User.last.id)
    else 
      puts @social_link.errors.full_messages 
      flash[:alert] = @social_link.errors.full_messages.join(", ")
      redirect_to edit_profile_path(User.last.id)
    end
  end

  def destroy
  end
  private
  def set_social_link
    @social_link = SocialLink.find(params[:id])
  end

  def social_link_params
    params.require(:social_link).permit(:icon, :link).merge(user_id: params[:profile_id])
  end

end
