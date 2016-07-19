class CartsController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :set_carts, only: [:show, :destroy]
    before_action :find_position, except: [:show, :destroy]

    def show
        @menus = Menu.main
        @buy_with = Product.cart_buy_with
        @order = Order.new
    end

    def destroy
        Position.where("cart_id = ?", @current_cart).destroy_all
        redirect_to @current_cart
    end

    def product_plus
        @position.change_count(1)
    end

    def product_minus
        @position.change_count(-1) if @position.count > 1
    end

    def beauty
        @position.change_beauty
    end

    def green
        @position.change_green
    end

    private
    def set_carts
        @current_cart = Cart.where('id = ?', params[:id]).first
        render 'layouts/404', status: 404 if @current_cart.nil? || @current_cart.id != session[:cart_id]
    end

    def find_position
        @position = Position.where("id = ?", params[:position]).first
        render nothing: true if @position.nil?
    end
end
