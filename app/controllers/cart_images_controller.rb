class CartImagesController < ApplicationController
  def create
    @post_image = PostImage.find(params[:post_image_id])
    cart_image = current_user.cart_images.new(post_image_id: @post_image.id)
    cart_image.save
  end

  def destroy
    @post_image = PostImage.find(params[:post_image_id])
    cart_image = current_user.cart_images.find_by(post_image_id: @post_image.id)
    cart_image.destroy
  end

end