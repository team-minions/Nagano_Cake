class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = @customer.deliveries
  end

  def create
  end

  def edit
    @delivery = Delivery.find(params[:id])
    redirect_to deliveries_path
  end

  def update
  end

  def destroy
  end
  
  def delivery_params
    params.require(:delivery).permit(:name, :postcode, :address)
  end
end
