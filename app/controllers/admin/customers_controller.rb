class Admin::CustomersController < ApplicationController
    before_action :authenticate_admin!
    def index
         @customers = Customer.all
         @customers = Customer.page(params[:page]).per(8)
    end
    
    def show
        @customer = Customer.find(params[:id])
    end
    
    def edit 
        @customer = Customer.find(params[:id])
    end
    
    def update
        customer = Customer.find(params[:id])
        customer.update(customer_params)
        if customer.save
            flash[:notice] = "会員情報の更新が完了しました"
            redirect_to admin_customer_path
        else
            customer.attributes = customer_params
            flash[:failed] = "会員情報の更新が失敗しました。"
            render :edit
        end
    end
    
    private
    def customer_params
        params.require(:customer).permit(:first_name,:last_name,:furigana_first_name,:furigana_last_name,:postcode,:address,:telephone_number,:email,:is_deleted)
    end
end
