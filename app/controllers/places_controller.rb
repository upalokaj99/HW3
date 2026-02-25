class PlacesController < ApplicationController

  def index
    @places = Place.order(:name)
  end

  def show
    @place = Place.find(params[:id])
    @entries = @place.entries.order(posted_on: :desc)
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)

    if @place.save
      redirect_to @place
    else
      render :new
    end
  end

  private

  def place_params
    params.require(:place).permit(:name)
  end

end
