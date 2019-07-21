class EventsController < ApplicationController

    def index
        @events = Event.all
        respond_to do |f|
            f.html { render :index }
            f.json { render json: @events }
        end
    end
    
    def new
        @event = Event.new
    end

    def create
        @event = Event.create(event_params)
        render json: @event
    end

    def show
        @event = Event.find(params[:id])
        render json: @event
    end

    def edit
        @event = Event.find(params[:id])
    end

    def update
        @event.update(event_params)
        @event.save
        redirect_to event_path(@event)
    end

    def destroy
        @event = Event.find(params[:id])
        @event = Event.destroy
        flash[:notice].notice = "User deleted."
        redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:title, :description, :location, :date, :start_time, :cost, :contact_info)
    end
end