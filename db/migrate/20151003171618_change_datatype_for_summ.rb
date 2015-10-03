class ChangeDatatypeForSumm < ActiveRecord::Migration
	def change
		change_table :carts do |t|
			t.change :summ, :integer
		end
	end
end
