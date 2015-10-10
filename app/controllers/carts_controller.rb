class CartsController < ApplicationController
	include CurrentCart
	before_action :set_cart
	before_action :set_carts, only: [:show, :destroy]

	def show
		if @current_cart.nil? || @current_cart.id != session[:cart_id]
			render "layouts/403", status: 404
		else
			@menus = Menu.main
			@buy_with = Product.cart_buy_with
			render :show
		end
	end

	def destroy
		if @cart.id == session[:cart_id]
			Position.where("cart_id = ?", @cart).each do |pos|
				pos.destroy
			end
		end
		respond_to do |format|
			format.html { redirect_to @cart }
			format.json { head :no_content }
		end
	end

	def product_plus
		@position = Position.where("id = ?", params[:position]).first
		@position.update_attribute('count', @position.count + 1)
		@position.cart.calc_summ
		@position.reload
		respond_to do |format|
			format.js
		end
	end

	def product_minus
		@position = Position.where("id = ?", params[:position]).first
		if @position.count > 1
			@position.update_attribute('count', @position.count - 1)
			@position.cart.calc_summ
		end
		@position.reload
		respond_to do |format|
			format.js
		end
	end

	def beauty
		@position = Position.where("id = ?", params[:position]).first
		if @position.beauty == true
			@position.update_attribute('beauty', false)
			@position.cart.calc_summ
		else
			@position.update_attribute('beauty', true)
			@position.cart.calc_summ
		end
		@position.reload
		respond_to do |format|
			format.js
		end
	end

	def green
		@position = Position.where("id = ?", params[:position]).first
		if @position.green == true
			@position.update_attribute('green', false)
			@position.cart.calc_summ
		else
			@position.update_attribute('green', true)
			@position.cart.calc_summ
		end
		@position.reload
		respond_to do |format|
			format.js
		end
	end

	private
		def set_carts
			@current_cart = Cart.where('id = ?', params[:id]).first
		end
end
