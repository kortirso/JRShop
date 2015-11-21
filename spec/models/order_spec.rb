RSpec.describe Order, type: :model do
    it { should validate_presence_of :person }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :cart_id }
    it { should belong_to :cart }
end
