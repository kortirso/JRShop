RSpec.describe Position, type: :model do
	it { should validate_presence_of :cart_id }
	it { should validate_presence_of :product_id }
	it { should validate_presence_of :count }
	it { should validate_numericality_of :count }
	it { should belong_to :cart }
	it { should belong_to :product }
end
