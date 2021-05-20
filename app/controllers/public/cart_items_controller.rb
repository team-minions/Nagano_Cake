class Public::CartItemsController < ApplicationController
  def index
    @cart_items = Cart_item.all
    @tax = 1.10
    @tax_included = Cart_item.count* @tax
  end

  def create
  end

  def update
  end

  def destroy
    @cart_item = Cart_item.find(params[:id])
    @cart_item.destroy
    redirect_to cart_item_path
  end

  def destroy_all
  end
end
