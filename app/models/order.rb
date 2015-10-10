class Order < ActiveRecord::Base
	belongs_to :cart

	validates :person, :phone, :cart_id, presence: true

	after_create :get_start_summ

	private
		def get_start_summ
			self.summ = self.cart.summ
			save!
		end
end
