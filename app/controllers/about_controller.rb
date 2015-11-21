class AboutController < ApplicationController
    include CurrentCart
    before_action :set_cart
    before_action :get_menu

    def delivery

    end

    def cash

    end

    def responces

    end

    def about

    end

    def contacts

    end

    private
    def get_menu
        @menus = Menu.main
    end
end
