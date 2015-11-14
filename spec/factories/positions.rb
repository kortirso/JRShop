FactoryGirl.define do
	factory :position do
		summ 0
		count 0
		association :cart
		association :product
	end
end
