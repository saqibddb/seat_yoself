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

    @reservation = @restaurant.reservations.build(reservation_params)
    @reservation.user = current_user
    if @reservation.save
      redirect_to restaurant_reservations_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  
  def reservation_params
    params.require(:reservation).permit(:time, :party_size, :restaurant_id)
  end

  def load_restaurant
    # binding.pry
    @restaurant = Restaurant.find(params[:restaurant_id])
  end

end
