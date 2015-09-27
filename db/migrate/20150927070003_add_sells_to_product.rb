class AddSellsToProduct < ActiveRecord::Migration
	def change
		add_column :products, :sells, :integer, default: 0
	end
end
