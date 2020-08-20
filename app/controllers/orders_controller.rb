class OrdersController < ApplicationController
  def new
    @user = current_user
    @user_shipping_addresses = Shipping.where(user_id: @user.id)
  end

  def about
    
  end

  def commision
    
  end
end
