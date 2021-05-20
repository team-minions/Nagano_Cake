
class Public::OrdersController < ApplicationController
    before_action :authenticate_customer!
    
    
    def new
        @customer = current_customer
        @order = Order.new(customer_id: current_customer.id)
        @deliveries = Delivery.where(customer_id: @customer.id)
    
    end

    def confirm
        @cart_items = CartItems.where(customer_id: current_customer.id)
        @order = Order.new(params)
        
    end

    def create
    end

    
    def complete
    end
    
    def index
        @orders = Order.where(customer_id: current_customer.id).order(created_at: "DESC")
    end
    
    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: @order)
    end
    
    
    
    
    
    
    
    
    private
    
    def order_params 
        params.require(:order).permit(:customer_id, )
    end
    

end
