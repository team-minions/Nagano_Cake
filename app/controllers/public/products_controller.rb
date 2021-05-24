class Public::ProductsController < ApplicationController
  def index
    @products = Product.page(params[:page]).reverse_order
  end

  def show
    @product = Product.find(params[:id])
    @cart_item = CartItem.new(product_id: @product.id)
    @genres = Genre.all
    @tax = 1.1
  end
  
  def search
    @products = Product.searchgenre(params[:word]).page(params[:page]).reverse_order
    @word = params[:word]
    render "index"
  end
end
