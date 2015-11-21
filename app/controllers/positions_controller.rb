class PositionsController < ApplicationController
    include CurrentCart
    before_action :set_cart

    def create
        product = Product.find(params[:product_id])
        position = @cart.add_product(product.id)
        respond_to do |format|
            if position.save
                @cart.calc_summ
                format.js
            end
        end
    end

    def drop
        position = Position.find(params[:position_id])
        if position.destroy
            @cart.calc_summ
            redirect_to cart_path(position.cart)
        end
    end
end
