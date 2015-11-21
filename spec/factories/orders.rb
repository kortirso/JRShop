FactoryGirl.define do
    factory :order do
        person 'Man'
        phone '920'
        summ 0
        association :cart
    end
end
