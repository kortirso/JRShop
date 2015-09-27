class Position < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	validates :cart_id, :product_id, :count, presence: true
	validates :count, numericality: true
end
