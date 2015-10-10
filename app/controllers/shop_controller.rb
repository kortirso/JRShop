class ShopController < ApplicationController
	include CurrentCart
	before_action :set_cart
	before_action :get_menu

	def category
		@category = Menu.where('link = ?', params[:category]).first
		@active = @category
		@products = Product.where(menu_id: @category).order(id: :desc)
	end

	def product
		@product = Product.where('link = ?', params[:product]).first
		@active = @product.menu
		@buy_with = Product.buy_with
	end

	def events
		@events = Event.all
	end

	def event
		@event = Event.where('link = ?', params[:event]).first
	end

	private
		def get_menu
			@menus = Menu.main
		end
end
