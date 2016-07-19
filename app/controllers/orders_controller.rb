class OrdersController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :find_order, only: :show

    def show
        @order.update_summ
        @menus = Menu.main
    end

    def create
        @cart.order.destroy unless @cart.order.nil?
        @order = Order.new(orders_params.merge(cart_id: @cart.id))
        if @order.save
            redirect_to @order
        else
            redirect_to cart_path(session[:cart_id]), notice: 'You did not enter your credentials'
        end
    end

    private
    def orders_params
        params.require(:order).permit(:person, :phone, :cart_id, :get_by_self, :caption, :check_city, :check_factory, :address, :summ)
    end

    def find_order
        @order = Order.find_by(id: params[:id])
        render 'layouts/404', status: 404 if @order.nil? || @order.cart_id != session[:cart_id]
    end
end