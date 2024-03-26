class PagesController < ApplicationController
  def home
    @mentors = User.all.where(role: 1).order(view_count: :desc)
  end

  def dashboard; end
end
