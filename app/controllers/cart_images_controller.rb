class CartImagesController < ApplicationController
  def create
    # @post_imageはJSファイル用にインスタンス変数にしています。
    @post_image = PostImage.find(params[:post_image_id])
    cart_image = current_user.cart_images.new(post_image_id: @post_image.id)
    cart_image.save
  end

  def destroy
    # @post_imageはJSファイル用にインスタンス変数にしています。
    @post_image = PostImage.find(params[:post_image_id])
    cart_image = current_user.cart_images.find_by(post_image_id: @post_image.id)
    cart_image.destroy
  end

  def index
    @cart_images = CartImage.where(user_id: current_user.id)
    @exist_cart_image = @cart_images.where(user_id: current_user.id).exists?
  end

  def destroy_all
    cart_images = CartImage.where(user_id: current_user.id)
    if cart_images.destroy_all
      flash[:success] = "カートの中身を空にしました。"
      redirect_to top_path
    end
  end

end