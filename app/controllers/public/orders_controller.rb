
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
        @pay_method = params[:order][:pay_method]


        case params[:order][:address_sellect]
        when "1"
            @order.delivery_postcode = current_customer.postcode
            @order.delivery_address = current_customer.address
            @order.delivery_name = current_customer.first_name + current_customer.last_name
        when "2"
            @order.delivery_postcode = Delivery.find(params[:order][:address]).postcode
            @order.delivery_address = Delivery.find(params[:order][:address]).address
            @order.delivery_name = Delivery.find(params[:order][:address]).name
        when "3"
            @order.delivery_postcode = params[:order][:delivery_postcode]
            @order.delivery_address = params[:order][:delivery_address]
            @order.delivery_name = params[:order][:delivery_name]
        end
    end

    def create
        @order = current_customer.orders.new(order_params)
        @cart_items = current_customer.cart_items.all


        if @order.save
            @cart_items.each do |cart_item|
                @order_item = OrderItem.new(order_id: @order.id)
                @order_item.product_id = cart_item.product_id
                @order_item.product_count = cart_item.product_count
                @order_item.price = cart_item.product.price
                @order_item.save
            end
            current_customer.cart_items.destroy_all
            redirect_to controller: :orders, action: :complete

        else
            redirect_to controller: :orders, action: :new
        end
    end


    def complete
    end

    def index
        @orders = Order.where(customer_id: current_customer.id).order(created_at: "DESC")
        @order_items = OrderItem.where(order_id: @orders)
    end

    def show
        @order = Order.find(params[:id])
        @order_items = OrderItem.where(order_id: @order)
        @subtotals = @order_items.map { |order_item| (order_item.product_count * 1.1 * order_item.price ).to_i }
        @sum = @subtotals.sum
    end








    private

    def order_params
        params.require(:order).permit(:customer_id, :shipping_fee, :pay_amount, :pay_method, :delivery_name, :delivery_postcode, :delivery_address, :status)
    end


end
