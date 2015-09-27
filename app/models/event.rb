class Event < ActiveRecord::Base
	scope :started,				-> { where('time_start < ?', Time.current) }
	scope :not_finished,	-> { where('time_finished > ?', Time.current) }
	scope :active, 				-> { started.not_finished }

	validates :name, :caption, :time_start, :time_finish, presence: true
end
