class Order < ActiveRecord::Base
    belongs_to :cart

    validates :person, :phone, :cart_id, presence: true

    after_create :update_summ

    def update_summ
        self.update(summ: self.cart.summ)
    end
end
