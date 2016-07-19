class Cart < ActiveRecord::Base
    has_many :positions
    has_many :products, through: :positions
    has_one :order

    validates :summ, numericality: true

    BEAUTY_PRICE = 300
    GREEN_PRICE = 300

    def add_product(product_id)
        current_product = positions.find_by(product_id: product_id)
        current_product ? current_product.update(count: current_product.count + 1) : current_product = positions.create(product_id: product_id)
        self.calc_summ
    end

    def calc_summ
        self.summ = 0
        positions.each do |position|
            base_price = position.product.price
            base_price += BEAUTY_PRICE if position.beauty
            base_price += GREEN_PRICE if position.green
            position.update(summ: position.count * base_price)
            self.summ += position.summ
        end
        save
    end
end
