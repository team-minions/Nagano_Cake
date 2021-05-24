class SearchesController < ApplicationController
    @range = params[:range]
	search = params[:search]
	word = params[:word]
	if @range == '1'
		@product = Product.search(search,word)
	else
		@customer = Customer.search(search,word)
	end
end

