class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @tax = 1.1
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end

  def destroy_all
    # customer = Customer.find(current_customer.id)
    # if customer.cart_items.destroy_all
    #   flash[:notice] = "カート内の商品を全て削除しました。"
    #   redirect_to cart_item_path
    # else
    #   render action: :index
    # end
   current_customer.cart_items.destroy_all
   redirect_to cart_items_path
  end

    private

  def cart_item_params
    params.require(:cart_item).permit(:product_count,:product_id)
  end
end
