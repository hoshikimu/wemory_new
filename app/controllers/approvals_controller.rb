class ApprovalsController < ApplicationController
  def search
    
  end

  def permission
    @user = User.find_by(name: params[:name], email: params[:email])
  end
end
