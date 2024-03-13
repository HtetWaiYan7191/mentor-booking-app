class PagesController < ApplicationController
  def home
    @user = User.first
  end
  

  def dashboard
  end
end
