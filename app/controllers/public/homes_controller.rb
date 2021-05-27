class Public::HomesController < ApplicationController

    def top
        @products = Product.all
    end

    def about
        render layout: 'about'
    end
end
