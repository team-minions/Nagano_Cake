class Admin::OrdersController < ApplicationController
  # before_action :authenticate_admin!

  def index
    @orders = Order.page(params[:page]).reverse_order
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end
  
end
