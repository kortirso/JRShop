class ProductsController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_manager!

	def index
		@products = Product.all
	end

	def show
	end

	def new
		@product = Product.new
	end

	def edit
	end

	def create
		@product = Product.new(product_params)
		respond_to do |format|
			if @product.save
				format.html { redirect_to @product }
			else
				format.html { render :new}
			end
		end
	end

	def update
		respond_to do |format|
			if @product.update(product_params)
				format.html { redirect_to @product }
			else
				format.html { render :edit}
			end
		end
	end

	def destroy
		@product.destroy
		respond_to do |format|
			format.html { redirect_to products_path}
		end
	end

	private
		def set_product
			@product = Product.find(params[:id])
		end

		def product_params
			params.require(:product).permit(:name, :price, :caption, :menu_id, :image, :availability, :link)
		end
end
