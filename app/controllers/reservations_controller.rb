class ReservationsController < ApplicationController
  before_filter :load_restaurant

  # TODO: Discuss permissions of user to see if a user can delete or edit a reservation

  def index
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def new

  end

  def edit
  end

  def create
    binding.pry
    # d = DateTime.new(params[:date][:day])

    puts params

    @ex = params

  end

  def update
  end

  def destroy
  end

  private

  
  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
