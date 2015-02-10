class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show, :update, :destroy]
  before_action :set_location
  def index
  @events = Event.all
  end

  def new
    @event = Event.new
  end

  def show
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @event.location_id = params[:location_id]
    if @event.save
      redirect_to location_path(@location), notice: "Event has been successfully created."
    else
      render :new
    end
  end

  def update
    if @event.save
      redirect_to location_path(@location), notice: "Event has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    if @event.destroy
      redirect_to location_path(@location), notice: "Event has been successfully destroyed"
    end
  end

private

def set_event
  @event = Event.find(params[:id])
end

def set_location
  @location = Location.find(params[:location_id])
end

def event_params
  params.require(:event).permit(:description, :date, :location_id, :requires_id)
end

end
