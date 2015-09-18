class ShopController < ApplicationController
	include CurrentCart
	before_action :set_cart
	before_action :get_full_menu

	def category
		@category = Menu.where('link = ?', params[:category]).first
		@products = Product.where(menu_id: @category)
	end

	def product
		@product = Product.where('link = ?', params[:product]).first
	end

	def event
		@event = Event.where('link = ?', params[:event]).first
	end

	private
		def get_full_menu
			@menus = Menu.all
		end
end
