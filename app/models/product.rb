class Product < ActiveRecord::Base
	has_many :positions
	has_many :carts, through: :positions
	belongs_to :menu

	mount_uploader :image, ImageUploader

	validates :name, :price, :image, :availability, presence: true
	validates :price, numericality: true
end
