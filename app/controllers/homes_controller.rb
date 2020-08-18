class HomesController < ApplicationController
  def about
    
  end

  def top
    @post_image = PostImage.find(13)
    @categories = Category.where(user_id: current_user.id)
    @post_images = PostImage.where(user_id: current_user.id).order("RANDOM()").limit(9)
  end
end
