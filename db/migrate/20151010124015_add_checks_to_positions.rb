class AddChecksToPositions < ActiveRecord::Migration
	def change
		add_column :positions, :beauty, :boolean, default: false
		add_column :positions, :green, :boolean, default: false
	end
end
