class Product < ActiveRecord::Base
    has_many :positions
    has_many :carts, through: :positions
    belongs_to :menu

    validates :name, :price, :caption, :availability, :link, :sells, :menu_id, presence: true
    validates :price, :sells, numericality: true
    validates :link, uniqueness: true

    mount_uploader :image, ImageUploader

    scope :with_sells, -> { where('sells > 0') }
    scope :seasonable, -> { where(season: true) }

    private
    def self.top_sells
        with_sells.count >= 8 ? with_sells.order(sells: :desc).limit(8) : all.sample(8)
    end

    def self.buy_with
        # Пока берутся 4 случайных товара
        # В перспективе внедрить расчет
        all.sample(4)
    end

    def self.cart_buy_with
        # Пока берутся 4 случайных товара
        # В перспективе внедрить расчет
        all.sample(4)
    end

    def self.get_slides
        seasonable.count >= 5 ? seasonable.order(id: :desc).limit(5) : all.sample(5)
    end
end
