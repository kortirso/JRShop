class PositionsController < ApplicationController
	include CurrentCart
	before_action :set_cart
	after_action :calc_summ

	def create
		product = Product.find(params[:product_id])
		@position = @cart.add_product(product.id)
		respond_to do |format|
			if @position.save
				format.js
			end
		end
	end

	def drop
		@position = Position.find(params[:position_id])
		respond_to do |format|
			if @position.destroy
				format.html { redirect_to cart_path(@position.cart) }
			end
		end
	end

	private
		def calc_summ
			cart = Cart.find(session[:cart_id])
			cart.summ = 0
			cart.positions.each do |position|
				cart.summ += position.count * position.product.price
			end
			cart.save!
		end
end
