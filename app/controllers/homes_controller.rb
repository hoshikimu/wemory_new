class HomesController < ApplicationController
  def about
    
  end

  def top
    @main_post_images = PostImage.where(user_id: current_user.id)
    @categories = Category.where(user_id: current_user.id)
    @post_images = PostImage.where(user_id: current_user.id).order("RANDOM()").limit(9)
  end
end
