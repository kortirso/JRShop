class OrdersController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def show
		@order = Order.where("id = ?", params[:id]).first
		if @order && @order.cart.id == session[:cart_id]
			@order.summ = @order.cart.summ
			@order.save!
			@menus = Menu.main
			render :show
		else
			render "layouts/403", status: 404
		end
	end

	def create
		cart = Cart.find(session[:cart_id])
		if cart.order.nil?
			@order = Order.new(orders_params)
			@order.cart = cart
			if @order.save
				redirect_to @order
			else
				redirect_to cart_path(session[:cart_id])
			end
		else
			@order = cart.order
			redirect_to @order
		end
	end

	private
		def orders_params
			params.require(:order).permit(:person, :phone, :cart_id, :get_by_self, :caption, :check_city, :check_factory, :address, :summ)
		end
end