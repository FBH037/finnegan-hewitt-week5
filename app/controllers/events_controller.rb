class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :show, :update, :destroy]
  before_action :set_location, only: [:edit, :show, :update, :destroy]

  def new
    @events = Events.all
  end

  def show
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to location_events_path, notice: "Event has been successfully created."
    else
      render :new
    end
  end

  
end
