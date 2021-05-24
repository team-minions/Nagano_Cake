class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
    @tax = 1.1
    @subtotal = @cart_items.map { |cart_item| (Product.find(cart_item.product_id).price * @tax * cart_item.product_count ).to_i }
    @sum = @subtotal.sum.to_i
    @i = 0
  end

  def create
    @cart_item = current_customer.cart_items.new(cart_item_params)
    if @cart_item.save
      redirect_to cart_items_path
    end
  end

  def update
    @cart_item = CartItem.find(params[:id])
    @cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    @cart_item = CartItem.find(params[:id])
    @cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    current_customer.cart_items.destroy_all
    @cart_item = current_customer.cart_items
    @cart_item.destroy_all
    flash[:alert] = "カートの商品を全て削除しました"
    redirect_to cart_items_path
  end

    private

  def cart_item_params
    params.require(:cart_item).permit(:product_count,:product_id)
  end
end
