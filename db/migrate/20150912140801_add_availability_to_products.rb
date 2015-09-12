class AddAvailabilityToProducts < ActiveRecord::Migration
	def change
		add_column :products, :availability, :boolean, default: true
	end
end
