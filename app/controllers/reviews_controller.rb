class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_place, only: [:new, :create]
  respond_to :html

  def new
    @review = @place.reviews.build
  end

  def create
    @review = current_user.reviews.build review_params
    @review.place = @place
    @review.save

    respond_with @review, location: place_path(@place)
  end

  def destroy
    @review = Review.find params[:id]
    place = @review.place
    @review.destroy

    redirect_to place_path(place)
  end

  private

  def set_place
    @place = Place.find params[:place_id]
  end

  def review_params
    params.require(:review).permit :score, :comment
  end
end