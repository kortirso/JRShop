class Cart < ActiveRecord::Base
	has_many :positions
	has_many :products, through: :positions

	def add_product(product_id)
		current_product = positions.find_by(product_id: product_id)
		current_product ? current_product.quantity += 1 : current_product = positions.build(product_id: product_id)
		current_product
	end
end
