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
    @genres = Genre.searchgenre(params[:word])
    @genres.each do |genre|
      @products = Product.where(genre_id: genre.id).page(params[:page]).reverse_order
    end
    @word = params[:word]
    render "index"
  end
end
