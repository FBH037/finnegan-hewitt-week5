class LocationsController < ApplicationController
  before_action :set_location, only: [:edit, :update, :show, :destroy]
  def index
    @locations = Location.all
  end

  def new
  @location = Location.new
  end

  def show
  end

  def edit
  end

  def create
    @location = Location.new(location_params)
    if @location.save
      redirect_to locations_path, notice: "Location has been successfully created."
    else
      render :new
    end
  end

  def update
    if @location.save
      redirect_to locations_path, notice: "Location has been successfully updated."
    else
      render :edit
    end
  end

  def destroy
  @location.destroy
    if @location.destroy
      redirect_to locations_path, notice: "Location has been successfully destroyed."
    end
  end

  private

    def set_location
      @location = Location.find(params[:id])
    end

    def location_params
      params.require(:location).permit(:name, :address, :zipcode)
    end
end
