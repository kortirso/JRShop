class ChangeEventModel < ActiveRecord::Migration
	def change
		remove_column :events, :time_start
		remove_column :events, :time_finish
		add_column :events, :active, :boolean, default: true
	end
end
