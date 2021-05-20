class Admin::ProductsController < ApplicationController
    
    def index
        @products = Product.all.order("id")
    
    end

    def show
        @product = Product.find(params[:id])
        @price_tax_included = @product.price.to_s*1.08
          
    end

    def new
        @product = Product.new
        @genre = Genre.new
    end

    def create
        @product = Product.new(product_params)
        if  @product.save
          redirect_to  admin_product_path(@product), notice: ""
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
        params.require(:product).permit(:genre_id, :name, :description, :price, :image_id, :is_active )
    end

    
end
