class Product < ActiveRecord::Base
	has_many :positions
	has_many :carts, through: :positions
	belongs_to :menu

	mount_uploader :image, ImageUploader

	scope :with_sells,	-> { where('sells > 0') }

	#validates :image, presence: true
	validates :name, :price, :caption, :availability, :link, :sells, :season, :menu_id, presence: true
	validates :price, :sells, numericality: true
	validates :link, uniqueness: true

	private
		def self.top_sells
			tops = Product.with_sells.count >= 8 ? tops = Product.with_sells.order(sells: :desc).limit(8) : tops = Product.all.sample(8)
		end
end
