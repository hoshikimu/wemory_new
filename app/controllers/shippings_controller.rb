class ShippingsController < ApplicationController
  def new
    @shippings = Shipping.where(user_id: current_user.id)
    @new_shipping = Shipping.new
  end

  def create
    new_shipping = Shipping.new(shipping_params)
    new_shipping.user_id = current_user.id
    if new_shipping.save
      redirect_to new_shipping_path
    else
      @shippings = Shipping.where(user_id: current_user.id)
      @new_shipping = Shipping.new
      render :new
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    shipping = Shipping.find(params[:id])
    if shipping.update(shipping_params)
      redirect_to new_shipping_path
    else
      shipping = Shipping.find(params[:id])
      render :edit
    end
  end

  def destroy
    shipping = Shipping.find(params[:id])
    shipping.destroy
    redirect_to new_shipping_path
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :receiver, :phone_number)
  end
end
