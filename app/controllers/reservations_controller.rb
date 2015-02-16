class ReservationsController < ApplicationController
  # before_filter :load_restaurant

  # TODO: Discuss permissions of user to see if a user can delete or edit a reservation

  def index
    @reservations = Reservation.where(:user_id => current_user.id)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id])
    # if @restaurant.available?(reservation_params[:party_size], reservation_params[:date], reservation_params[:hour])
    @reservation = @restaurant.reservations.new(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_reservation_path(@restaurant, @reservation)
    else
      render "restaurants/show"
      # redirect_to restaurant_path(@restaurant)
    end
  end

  def edit
    @reservation = Reservation.find(params[:id])
    @restaurant = @reservation.restaurant
  end

  def update
    @reservation = Reservation.find(params[:id])

    if @reservation.update_attributes(reservation_params)
      redirect_to restaurant_reservation_path(@reservation.restaurant, @reservation)
    else
      render :edit_restaurant_reservation
    end
  end

  def destroy
    @reservation = Reservation.find(params[:id])
    @reservation.destroy
    redirect_to :restaurant_reservations
  end

  private
  
  def reservation_params
    params.require(:reservation).permit(:date, :hour, :party_size, :restaurant_id)
  end

  def load_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
