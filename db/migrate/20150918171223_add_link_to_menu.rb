class AddLinkToMenu < ActiveRecord::Migration
	def change
		add_column :menus, :link, :string
	end
end
