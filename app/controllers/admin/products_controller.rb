class Admin::ProductsController < ApplicationController
    
    def index
        @products = Product.all
    
    end

    def show
        @product = Product.find(params[:id])
    end

    def new
        @product = Product.new
        @genres = Genre.all
    end

    def create
        @product = Product.new(product_params)
        if  @product.save
          redirect_to  admin_products_path(@product), notice: ""
        else
          render "admin/products/new"
        end
    end
    
    def edit
        @product = Product.find(params[:id])
    end
    
    def update
        @product = Product.find(params[:id])
        if @product.update(product_params)
            redirect_to admin_product_path(@product)
        else
            render "admin/products/edit"
        end
    end
    
    
    private
    
    def product_params
        params.require(:product).permit(:genre_id, :name, :description, :price, :image, :is_active)
    end
end
