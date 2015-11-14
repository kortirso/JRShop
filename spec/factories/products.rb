FactoryGirl.define do
	factory :product do
		name 'Product'
		price 100
		caption 'Product caption'
		availability true
		sequence (:link) { |i| "product#{i}"}
		sells 0
		season false
		association :menu
	end
end
