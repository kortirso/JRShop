class Product < ActiveRecord::Base
	has_many :positions
	has_many :carts, through: :positions
	belongs_to :menu

	#mount_uploader :image, ImageUploader

	#validates :image, presence: true
	validates :name, :price, :availability, :link, presence: true
	validates :price, numericality: true
end
