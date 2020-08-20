class OrdersController < ApplicationController
  def new
    user = current_user
    @user_shipping_addresses = Shipping.where(user_id: user.id)
  end

  def about
    user = current_user
    @payment_method = params[:payment_method]
    button_selected = params[:selected]
    case button_selected
    when "a"
      if params[:shipping_address].blank?
        flash[:danger] = "お届け先が未入力です。"
        @user_shipping_addresses = Shipping.where(user_id: user.id)
        render :new
      else
        shipping_address_id = params[:shipping_address]
        @postal_code = user.shippings.find(shipping_address_id).postal_code
        @address = user.shippings.find(shipping_address_id).address
        @receiver = user.shippings.find(shipping_address_id).receiver
        @phone_number = user.shippings.find(shipping_address_id).phone_number
      end
    when "b"
      if params[:postal_code].blank? || params[:address].blank? || params[:receiver] || params[:phone_number].blank?
        flash[:danger] = "お届け先が未入力です。"
        @user_shipping_addresses = Shipping.where(user_id: user.id)
        render :new
      else
        @postal_code = params[:postal_code]
        @address = params[:address]
        @receiver = params[:receiver]
        @phone_number = params[:phone_number]
      end
    end
    @cart_images = CartImage.where(user_id: user.id)
    @quantity = params[:quantity]
    @postage = 500
    album_price = 2000
    @total = (album_price * @quantity.to_i) + @postage
    @order_new = Order.new
  end

  def create
    user = current_user
    new_order = Order.new(order_params)
    new_order.user_id = user.id
    cart_images = CartImage.where(user_id: user.id)
    if new_order.save
      cart_images.each do |cart_image|
        new_order_image = OrderImage.new
        new_order_image.order_id = new_order.id
        new_order_image.post_image_id = cart_image.post_image_id
        new_order_image.save
      end
      cart_images.destroy_all
      redirect_to order_completion_path
    else
      @user_shipping_addresses = Shipping.where(user_id: user.id)
      render :new
    end
  end

  def completion
    
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :address, :receiver, :phone_number, :quantity, :postage, :total)
  end
end
