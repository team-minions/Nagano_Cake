class Public::DeliveriesController < ApplicationController
  def index
    @delivery = Delivery.new
    @deliveries = current_customer.deliveries.all


  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.customer_id = current_customer.id
    if @delivery.save
      flash[:notice] = "配送先の登録が完了しました"
      redirect_to deliveries_path
    else
      @customer = current_customer
      @deliveries = current_customer.deliveries.all
      render :index
    end
  end

  def edit
    @delivery = Delivery.find(params[:id])
  end

  def update
    @delivery = Delivery.find(params[:id])
    if @delivery.update(delivery_params)
      flash[:notice] = "配送先の更新が完了しました"
      redirect_to deliveries_path(@delivery.id)
    else
      render :edit
    end
  end

  def destroy
    @delivery = Delivery.find(params[:id])
    @delivery.destroy
    redirect_to deliveries_path
  end

  def delivery_params
    params.require(:delivery).permit(:name, :postcode, :address)
  end
end
