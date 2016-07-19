class PositionsController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :find_position, only: :drop

    def create
        @cart.add_product(params[:product_id])
    end

    def drop
        @position.removing
        redirect_to cart_path(@cart)
    end

    private
    def find_position
        @position = @cart.positions.find_by(id: params[:position_id])
        render nothing: true if @position.nil?
    end
end
