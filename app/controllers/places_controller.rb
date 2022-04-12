class PlacesController < ApplicationController

  def index
    @places = Place.all
    render template: "places/index"
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

  def update
    place = Place.find_by(id: params[:id])
    place.name = params["name"] || place.name
    place.address = params["address"] || place.address
    place.save
    render json: place
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    render json: {message: "Place deleted"}
  end

end
