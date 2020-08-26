class OrdersController < ApplicationController
  before_action :ensure_correct_user?, only: :show

  def ensure_correct_user?
    order_user_id = Order.find(params[:id]).user_id
    if order_user_id != current_user.id
      redirect_to top_path
      flash[:alert] = "閲覧権限がありません。"
    end
  end

  def new
    # エラーメッセージの部分テンプレートを使用するため、@order_newを作成しています。
    @new_order = Order.new
    user = current_user
    @user_shipping_addresses = Shipping.where(user_id: user.id)
  end

  def about
    # エラーメッセージの部分テンプレートを使用するため、@order_newを作成しています。
    @new_order = Order.new
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
        @prefecture_code = user.shippings.find(shipping_address_id).prefecture_code
        @address_city = user.shippings.find(shipping_address_id).address_city
        @address_street = user.shippings.find(shipping_address_id).address_street
        @address_building = user.shippings.find(shipping_address_id).address_building
        @receiver = user.shippings.find(shipping_address_id).receiver
        @phone_number = user.shippings.find(shipping_address_id).phone_number
      end
    when "b"
      if params[:postal_code].blank? || params[:prefecture_code].blank? || params[:address_city].blank? || params[:address_street].blank? || params[:receiver].blank? || params[:phone_number].blank?
        flash[:danger] = "お届け先が未入力です。"
        @user_shipping_addresses = Shipping.where(user_id: user.id)
        render :new
      else
        @postal_code = params[:postal_code].to_s.delete("-")
        @prefecture_code = params[:prefecture_code]
        @address_city = params[:address_city]
        @address_street = params[:address_street]
        @address_building = params[:address_building]
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
    @new_order = Order.new(order_params)
    @new_order.user_id = user.id
    cart_images = CartImage.where(user_id: user.id)
    if @new_order.save
      cart_images.each do |cart_image|
        new_order_image = OrderImage.new
        new_order_image.order_id = @new_order.id
        new_order_image.post_image_id = cart_image.post_image_id
        new_order_image.image_id = PostImage.find(cart_image.post_image_id).image_id
        new_order_image.save
      end
      cart_images.destroy_all
      redirect_to orders_completion_path
    else
      @user_shipping_addresses = Shipping.where(user_id: user.id)
      render :new
    end
  end

  def completion
    
  end

  def index
    @orders = Order.where(user_id: current_user).order(created_at: "DESC")
    @exist_order = @orders.exists?
  end

  def show
    @order = Order.find(params[:id])
    @order_images = OrderImage.where(order_id: @order.id)
  end

  private
  def order_params
    params.require(:order).permit(:payment_method, :postal_code, :prefecture_code, :address_city, :address_street, :address_building, :receiver, :phone_number, :quantity, :postage, :total)
  end
end
