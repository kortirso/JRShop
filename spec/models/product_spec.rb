RSpec.describe Product, type: :model do
	it { should validate_presence_of :name }
	it { should validate_presence_of :price }
	it { should validate_presence_of :caption }
	it { should validate_presence_of :availability }
	it { should validate_presence_of :link }
	it { should validate_presence_of :sells }
	it { should validate_presence_of :menu_id }
	it { should validate_numericality_of :price }
	it { should validate_numericality_of :sells }
	it { should validate_uniqueness_of :link }
	it { should belong_to :menu }
	it { should have_many :positions }
	it { should have_many :carts }
end
