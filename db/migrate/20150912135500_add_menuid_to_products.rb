class AddMenuidToProducts < ActiveRecord::Migration
	def change
		add_column :products, :menu_id, :integer
	end
end
