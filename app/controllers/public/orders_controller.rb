
class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    
    def new
        
        @order = Order.new(customer_id: current_customer.id)
        @deliveries = Delivery.where(customer_id: current_customer.id)
        
    end

    def confirm
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @subtotals = @cart_items.map { |cart_item| (Product.find(cart_item.product_id).price * 1.1 * cart_item.product_count ).to_i }
        
        
        @sum = @subtotals.sum
        @pay_amount = @sum + 800
        @order = Order.find_by(customer_id: current_customer.id)
        
        @pay_method = params[:pay_method]
        
        case params[:address_sellect]
        when 1
            @delivery_postcode = current_customer.postcode
            @delivery_address = current_customer.address
            @delivery_name = current_customer.first_name + current_customer.last_name
        when 2
            @delivery_postcode = Delivery.find(params[:address]).postcode
            @delivery_address = Delivery.find(params[:address]).address
            @delivery_name = Delivery.find(params[:address]).name
        when 3
            @delivery_postcode = params[:delivery_postcode]
            @delivery_address = params[:delivery_address]
            @delivery_name = params[:delivery_name]
        end
    end

    def create
        
    end

    
    def complete
    end
    
    def index
        @orders = Order.where(customer_id: current_customer.id).order(created_at: "DESC")
        @order_items = OrderItem.where(order_id: @orders.id)
    end
    
    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: @order)
    end
    
    
    
    
    
    
    
    
    private
    
    def order_params 
        params.require(:order).permit(:customer_id, :shipping_fee, :pay_amount, :pay_method, :delivery_name, :delivery_postcode, :delivery_address, :status)
    end
    

end
