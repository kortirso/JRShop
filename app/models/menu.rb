class Menu < ActiveRecord::Base
    has_many :lowers, class_name: 'Menu', foreign_key: 'upper_id'
    belongs_to :upper, class_name: 'Menu'
    has_many :products

    validates :name, :link, presence: true
    validates :link, uniqueness: true

    scope :main, -> { where(upper_id: nil) }
    scope :subs, -> (main) { where(upper_id: main) }
end
