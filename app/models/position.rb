class Position < ActiveRecord::Base
    belongs_to :cart
    belongs_to :product

    validates :cart_id, :product_id, :count, presence: true
    validates :count, numericality: true

    after_create :get_start_summ

    def change_count(koef)
        self.update_attribute('count', self.count + koef)
        self.reloading
    end

    def change_beauty
        self.update_attribute('beauty', !self.beauty)
        self.reloading
    end

    def change_green
        self.update_attribute('green', !self.green)
        self.reloading
    end

    def reloading
        self.cart.calc_summ
        self.reload
    end

    private
    def get_start_summ
        self.update(summ: self.product.price)
    end
end
