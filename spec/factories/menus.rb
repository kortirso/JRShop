FactoryGirl.define do
	factory :menu do
		name 'first_menu'
		sequence (:link) { |i| "upper#{i}" }
	end
	factory :lower_menu do
		name 'second_menu'
		sequence (:link) { |i| "lower#{i}" }
		association :menu
	end
end
