FactoryGirl.define do
	factory :event do
		name 'event'
		caption 'event_caption'
		sequence (:link) { |i| "event#{i}"}
	end
end
