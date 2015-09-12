class Cart < ActiveRecord::Base
	has_many :positions
	has_many :products, through: :positions
end
