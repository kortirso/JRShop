class Product < ActiveRecord::Base
	has_many :positions
	has_many :carts, through: :positions
	belongs_to :menu

	mount_uploader :image, ImageUploader

	scope :with_sells,	-> { where('sells > 0') }

	validates :name, :price, :caption, :availability, :link, :sells, :menu_id, presence: true
	validates :price, :sells, numericality: true
	validates :link, uniqueness: true

	private
		def self.top_sells
			tops = Product.with_sells.count >= 8 ? Product.with_sells.order(sells: :desc).limit(8) : Product.all.sample(8)
		end

		def self.buy_with
			# Пока берутся 4 случайных товара
			# В перспективе внедрить расчет
			buy_with = Product.all.sample(4)
		end
end
