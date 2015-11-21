RSpec.describe Cart, type: :model do
    it { should validate_numericality_of :summ }
    it { should have_many :positions }
    it { should have_many :products }
    it { should have_one :order }
end
