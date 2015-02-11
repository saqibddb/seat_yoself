class Admin::ApplicationController < ApplicationController

  before_action :authorize
  
  private
  def authorize
    unless current_user.admin == true
      flash[:notice] = "Unauthorized!"
      redirect_to "/"
    end
  end
end
