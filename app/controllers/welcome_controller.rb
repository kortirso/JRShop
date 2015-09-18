class WelcomeController < ApplicationController
	include CurrentCart
	before_action :set_cart

	def index
		@menus = Menu.main
	end
end
