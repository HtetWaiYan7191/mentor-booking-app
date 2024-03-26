class SocialLinksController < ApplicationController
  before_action :set_social_link, only: [:destroy, :update]
  def new
  end

  def create
    @social_link = SocialLink.new(social_link_params)
    if @social_link.save
      puts ' social link created '
      flash[:notice] = "Social link added successfully"
      redirect_to edit_profile_path(current_user.id)
    else 
      puts ' social link cannot be created '
      puts @social_link.errors.full_messages 
      flash[:alert] = @social_link.errors.full_messages.join(", ")
      redirect_to edit_profile_path(current_user.id)
    end
  end

  def edit

  end

  def update
    if @social_link.update(social_link_params)
      redirect_to edit_profile_path(social_link.user.id), notice: 'link updated successfully'
    else 
      redirect_to edit_profile_path(social_link.user.id), alert: 'link cannot update'
    end
  end


  def destroy
    if @social_link.destroy
      redirect_to edit_profile_path(@social_link.user.id), notice: "#{@social_link.link} was removed successfully "
    else 
      redirect_to edit_profile_path(@social_link.user.id), alert: 'Social link cannot be removed. '
    end
  end
  private
  def set_social_link
    @social_link = SocialLink.find(params[:id])
  end

  def social_link_params
    params.require(:social_link).permit(:icon, :link).merge(user_id: params[:profile_id])
  end

end
