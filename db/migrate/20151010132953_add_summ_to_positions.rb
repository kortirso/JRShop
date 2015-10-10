class AddSummToPositions < ActiveRecord::Migration
	def change
		add_column :positions, :summ, :integer
	end
end
