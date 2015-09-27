class AddSeasonToProduct < ActiveRecord::Migration
	def change
		add_column :products, :season, :boolean, default: false
	end
end
