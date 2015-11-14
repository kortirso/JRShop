RSpec.describe Menu, type: :model do
	it { should validate_presence_of :name }
	it { should validate_presence_of :link }
	it { should have_many :lowers }
	it { should belong_to :upper }
end
