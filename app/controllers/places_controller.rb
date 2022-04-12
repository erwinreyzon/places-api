class PlacesController < ApplicationController

  def index
    @places = Place.all
    render template: "places/index"
  end

  def show
    @place = Place.find_by(id: params[:id])
    render template: "places/show"
  end

  def create
    place = Place.new(
      name: params["name"],
      address: params["address"]
    )
    @place = place
    if place.save
      render template: "places/show"
    else
      render json: {errors: place.errors.full_messages}, status: 422
    end
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.name = params["name"] || @place.name
    @place.address = params["address"] || @place.address
    if @place.save
      render template: "places/show"
    else
      render json: {error: movies.errors.full_messages}, status: 422
    end
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    render json: {message: "Place deleted"}
  end

end
