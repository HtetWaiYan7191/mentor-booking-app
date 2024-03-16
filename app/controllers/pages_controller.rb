class PagesController < ApplicationController
  def home
    @mentors = User.all.where(role: 'mentor').order(view_count: :desc)
  end
  

  def dashboard
  end
end
