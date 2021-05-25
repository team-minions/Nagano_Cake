class Admin::OrderItemsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_item = OrderItem.find(params[:id])
    @order_item.update(order_item_params)
    @order = @order_item.order

    if @order_item.making_status == "製作中"
      @order.update(status: 2)
    elsif @order.order_items.count == @order.order_items.where(making_status: "制作完了").count
      @order.update(status: 3)
    end
    redirect_to admin_order_path(@order), flash: {success: "制作ステータス変更"}
  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status, :order_id)
  end

end
