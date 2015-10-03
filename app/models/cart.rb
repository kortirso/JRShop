class Cart < ActiveRecord::Base
	has_many :positions
	has_many :products, through: :positions

	validates :summ, numericality: true

	def add_product(product_id)
		current_product = positions.find_by(product_id: product_id)
		current_product ? current_product.count += 1 : current_product = positions.build(product_id: product_id)
		current_product
	end

	def calc_summ
		self.summ = 0
		positions.each do |position|
			self.summ += position.count * position.product.price
		end
		save!
	end
end
