class HomesController < ApplicationController
  def about
    
  end

  def top
    @post_image = PostImage.find(1)
    @categories = Category.all
    @post_images = PostImage.all.order("RANDOM()").limit(9)
  end
end
