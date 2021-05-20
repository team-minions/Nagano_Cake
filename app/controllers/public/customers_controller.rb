class Public::CustomersController < ApplicationController
    def show
    end

    def edit
        @customer = Customer.find_by(id:current_customer.id)
    end

    def update
        current_customer.update(customer_params)
        redirect_to customers_path
    end

    def retire
    end

    def confirm
    end
    
    private
    def customer_params
        params.require(:customer).permit(:first_name,:last_name,:furigana_first_name,:furigana_last_name,:postal_code,:address,:telephone_number,:email)
    end
end
