class CreateMenus < ActiveRecord::Migration
	def change
		create_table :menus do |t|
			t.references :upper, index: true
			t.timestamps null: false
		end
	end
end
