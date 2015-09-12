class Position < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	validates :cart_id, :product_id, presence: true
end
