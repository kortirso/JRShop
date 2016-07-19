class Cart < ActiveRecord::Base
    has_many :positions
    has_many :products, through: :positions
    has_one :order

    validates :summ, numericality: true

    def add_product(product_id)
        current_product = positions.find_by(product_id: product_id)
        current_product ? current_product.update(count: current_product.count + 1) : current_product = positions.create(product_id: product_id)
        self.calc_summ
    end

    def calc_summ
        self.summ = 0
        positions.each do |position|
            base_price = position.product.price
            base_price += 300 if position.beauty == true
            base_price += 300 if position.green == true
            position.summ = position.count * base_price
            position.save
            self.summ += position.summ
        end
        save
    end
end
