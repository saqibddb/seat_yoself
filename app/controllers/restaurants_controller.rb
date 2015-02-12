class RestaurantsController < ApplicationController

  # Within scope of user.... 
  # Only want them to see all restaurants and show a particular restaurant

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    if current_user
      @reservation = @restaurant.reservations.build
    end
  end

end
