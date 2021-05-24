class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @orders = Order.all.page(params[:page]).per(8)
  end
  
  def show
    @order = Order.find(params[:id])
  end
  
  def update
    @order = Order.find(params[:id])
    @order.update(order_params)
    redirect_to admin_order_path(@order.id), flash: {success: "注文ステータス変更"}
  end
  
  private
  
  def order_params
    params.require(:order).permit(:status)
  end

end
