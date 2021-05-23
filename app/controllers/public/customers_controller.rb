class Public::CustomersController < ApplicationController
    before_action :authenticate_customer!

    def show
    end

    def edit
        @customer = Customer.find_by(id:current_customer.id)
    end

    def update
        @customer = Customer.find_by(id:current_customer.id)
        @customer.update_attributes(customer_params)
        if @customer.save
            flash[:notice] = "会員情報の更新が完了しました"
            redirect_to admin_customers_path
        else
            @customer.attributes = customer_params
            flash[:failed] = "会員情報の更新が失敗しました。"
            render :edit
        end
    end

    def retire
        customer = Customer.find_by(id: current_customer.id)
        customer.update(is_deleted: true)
        reset_session
        redirect_to root_path
    end

    def confirm
    end
    
    private
    def customer_params
        params.require(:customer).permit(:first_name,:last_name,:furigana_first_name,:furigana_last_name,:postcode,:address,:phone_number,:email)
    end
end
