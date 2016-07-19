class ShopController < ApplicationController
    include CurrentCart
    before_action :find_category, only: :category
    before_action :find_product, only: :product
    before_action :find_event, only: :event
    before_action :set_cart
    before_action :get_menu

    def category
        @active = @menu
        @menu = Menu.where('link = ?', params[:sub]).first unless params[:sub].nil?
        @products = @menu.products.order(id: :desc)
    end

    def product
        @active = @product.menu
        @buy_with = Product.buy_with
    end

    def events
        @events = Event.all
    end

    def event
        
    end

    private
    def find_category
        @menu = Menu.where('link = ?', params[:category]).first
        render 'layouts/404', status: 404 if @menu.nil?
    end

    def find_product
        @product = Product.where('link = ?', params[:product]).first
        render 'layouts/404', status: 404 if @product.nil?
    end

    def find_event
        @event = Event.where('link = ?', params[:event]).first
        render 'layouts/404', status: 404 if @event.nil?
    end

    def get_menu
        @menus = Menu.main
    end
end
