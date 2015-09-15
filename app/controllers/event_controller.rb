class EventController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]

	def index
		@events = Event.all
	end

	def show
	end

	def new
		@event = Event.new
	end

	def edit
	end

	def create
		@event = Event.new(event_params)
		respond_to do |format|
				format.html {}
			else
				format.html {}
			end
		end
	end

	def update
		respond_to do |format|
			if @event.update(event_params)
				format.html {}
			else
				format.html {}
			end
		end
	end

	def destroy
		@event.destroy
		respond_to do |format|
			format.html {}
		end
	end

	private
		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:event).permit(:name, :image, :caption, :time_start, :time_finish)
		end
end
