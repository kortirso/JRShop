class CreateProducts < ActiveRecord::Migration
	def change
		create_table :products do |t|
			t.string :name, index: true
			t.float :price, default: 0
			t.text :caption
			t.timestamps null: false
		end
	end
end
