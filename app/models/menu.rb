class Menu < ActiveRecord::Base
    has_many :lowers, class_name: "Menu", foreign_key: "upper_id"
    belongs_to :upper, class_name: "Menu"

    scope :main,    -> { where(upper_id: nil) }
    scope :subs,    -> (main) { where(upper_id: main) }

    validates :name, :link, presence: true
end
