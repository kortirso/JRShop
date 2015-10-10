class Position < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	validates :cart_id, :product_id, :count, presence: true
	validates :count, numericality: true

	after_create :get_start_summ

	private
		def get_start_summ
			self.summ = self.product.price
		end
end
