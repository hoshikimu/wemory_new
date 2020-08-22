class ShippingsController < ApplicationController
  def new
    @shippings = Shipping.where(user_id: current_user.id)
    @new_shipping = Shipping.new
  end

  def create
    @new_shipping = Shipping.new(shipping_params)
    @new_shipping.user_id = current_user.id
    if @new_shipping.save
      flash[:success] = "配送先を作成しました！"
      redirect_to new_shipping_path
    else
      @shippings = Shipping.where(user_id: current_user.id)
      render :new
    end
  end

  def edit
    @shipping = Shipping.find(params[:id])
  end

  def update
    @shipping = Shipping.find(params[:id])
    if @shipping.update(shipping_params)
      flash[:success] = "配送先を編集しました！"
      redirect_to new_shipping_path
    else
      render :edit
    end
  end

  def destroy
    shipping = Shipping.find(params[:id])
    if shipping.destroy
      flash[:success] = "配送先を削除しました！"
      redirect_to new_shipping_path
    end
  end

  private
  def shipping_params
    params.require(:shipping).permit(:postal_code, :address, :receiver, :phone_number)
  end
end
