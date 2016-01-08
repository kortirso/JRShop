class WelcomeController < ApplicationController
    include CurrentCart
    before_action :set_cart, only: :index

    def index
        @menus = Menu.main
        @events = Event.order(id: :desc).limit(2)
        @tops = Product.top_sells
        @slides = Product.get_slides
    end

    def tomats

    end
end
