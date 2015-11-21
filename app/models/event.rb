class Event < ActiveRecord::Base
    validates :name, :caption, :link, presence: true
    validates :link, uniqueness: true
end
