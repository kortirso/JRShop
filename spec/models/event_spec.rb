RSpec.describe Event, type: :model do
    it { should validate_presence_of :name }
    it { should validate_presence_of :caption }
    it { should validate_presence_of :link }
    it { should validate_uniqueness_of :link }
end
