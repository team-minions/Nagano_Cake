class Public::DeliveriesController < ApplicationController
  def index
    # @deliveries = @customer.deliveries
    @delivery = Delivery.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  def delivery_params
    params.require(:delivery).permit(:name, :postcode, :address)
  end
end
