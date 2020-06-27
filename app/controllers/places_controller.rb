class PlacesController < ApplicationController
  before_action :authenticate_user!
  respond_to :html

  def index
    @q = Place.ransack(params[:q])
    @places = @q.result(distinct: true)

    @hash = Gmaps4rails.build_markers(@places.where.not(latitude: nil)) do |place, marker|
      marker.lat place.latitude
      marker.lng place.longitude
      marker.infowindow place.name
    end
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new place_params
    @place.save

    respond_with @place
  end

  def edit
    @place = Place.find params[:id]
  end

  def update
    @place = Place.find params[:id]
    @place.update kind_place_params

    redirect_to places_path
  end

  def show
    @place = Place.find params[:id]
    @hash = Gmaps4rails.build_markers(Place.where(id: params[:id])) do |place, marker|
      marker.lat        place.latitude
      marker.lng        place.longitude
      marker.infowindow place.name
    end
  end

  private

  def place_params
    params.require(:place).permit :name, :street, :number, :district, :zip_code, :city, :state, :complement
  end

  def kind_place_params
    params.require(:place).permit :kind
  end

end
