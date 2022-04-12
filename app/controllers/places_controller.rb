class PlacesController < ApplicationController

  def index
    places = Place.all
    render json: places
  end

  def show
    place = Place.find_by(id: params[:id])
    render json: place
  end

  def create
    place = Place.new(
      name: params["name"],
      address: params["address"]
    )
    place.save
    render json: place
  end

end
