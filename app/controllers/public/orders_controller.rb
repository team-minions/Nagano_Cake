
class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    
    def new
        @order = current_customer.orders.new
        
        @deliveries = Delivery.where(customer_id: current_customer.id)
        
    end

    def confirm
        @cart_items = CartItem.where(customer_id: current_customer.id)
        @subtotals = @cart_items.map { |cart_item| (Product.find(cart_item.product_id).price * 1.1 * cart_item.product_count ).to_i }
        
        
        @sum = @subtotals.sum
        @pay_amount = @sum + 800
        @order = current_customer.orders.new
        
        @pay_method = params[:pay_method]
        
        case params[:address_sellect]
        when 1
            @order.delivery_postcode = current_customer.postcode
            @order.delivery_address = current_customer.address
            @order.delivery_name = current_customer.first_name + current_customer.last_name
        when 2
            @order.delivery_postcode = Delivery.find(params[:address]).postcode
            @order.delivery_address = Delivery.find(params[:address]).address
            @order.delivery_name = Delivery.find(params[:address]).name
        when 3
            @order.delivery_postcode = params[:delivery_postcode]
            @order.delivery_address = params[:delivery_address]
            @order.delivery_name = params[:delivery_name]
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
