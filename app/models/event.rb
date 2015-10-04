class Event < ActiveRecord::Base
	validates :name, :caption, :link, presence: true
end
