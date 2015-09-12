class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|
			t.string :name, index: true
			t.string :image
			t.text :caption
			t.datetime :time_start
			t.datetime :time_finish
			t.timestamps null: false
		end
	end
end
