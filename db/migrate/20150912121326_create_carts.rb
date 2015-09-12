class CreateCarts < ActiveRecord::Migration
	def change
		create_table :carts do |t|
			t.float :summ, default: 0
			t.timestamps null: false
		end
	end
end
