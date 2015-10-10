class EventsController < ApplicationController
	before_action :set_event, only: [:show, :edit, :update, :destroy]
	before_action :authenticate_manager!

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
		if @event.save
			redirect_to @event
		else
			render :new
		end
	end

	def update
		if @event.update(event_params)
			redirect_to @event
		else
			render :edit
		end
	end

	def destroy
		@event.destroy
		redirect_to events_path
	end

	private
		def set_event
			@event = Event.find(params[:id])
		end

		def event_params
			params.require(:event).permit(:name, :image, :caption, :time_start, :time_finish)
		end
end
