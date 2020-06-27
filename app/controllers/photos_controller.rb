class PhotosController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:new, :create]
  respond_to :html

  def new
    @photo = @place.photos.build
  end

  def create
    @photo = current_user.photos.build photo_params
    @photo.place = @place
    @photo.save

    respond_with @photo, location: place_path(@place)
  end

  def destroy
    @photo = photo.find params[:id]
    place = @photo.place
    @photo.destroy

    redirect_to place_path(place)
  end

  private

  def set_place
    @place = Place.find params[:place_id]
  end

  def photo_params
    params.require(:photo).permit :image
  end
end