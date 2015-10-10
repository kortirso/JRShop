class CreateOrders < ActiveRecord::Migration
	def change
		create_table :orders do |t|
			t.integer :cart_id
			t.string :person
			t.string :phone
			t.boolean :get_by_self, default: true
			t.text :caption
			t.boolean :check_city
			t.boolean :check_factory
			t.string :address
			t.integer :summ
			t.timestamps null: false
		end
	end
end
