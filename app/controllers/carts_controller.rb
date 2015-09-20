class CartsController < ApplicationController
	include CurrentCart
	before_action :set_cart
	before_action :set_carts, only: [:show, :destroy]

	def show
		if @current_cart.nil? || @current_cart.id != session[:cart_id]
			render "layouts/403", status: 404
		else
			@menus = Menu.main
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
		@total_summ = calc_summ(@position.cart)
		respond_to do |format|
			format.js
		end
	end

	def product_minus
		@position = Position.where("id = ?", params[:position]).first
		if @position.count > 1
			@position.update_attribute('count', @position.count - 1)
			@total_summ = calc_summ(@position.cart)
		end
		respond_to do |format|
			format.js
		end
	end

	private
		def set_carts
			@current_cart = Cart.where('id = ?', params[:id]).first
		end

		def calc_summ(cart)
			cart.summ = 0
			cart.positions.each do |position|
				cart.summ += position.count * position.product.price
			end
			cart.save!
			cart.summ
		end
end
