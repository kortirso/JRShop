class WelcomeController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
		@menus = Menu.main
		@events = Event.order(id: :desc).limit(2)
		@tops = Product.top_sells
	end
end
