class Admin::RestaurantsController < Admin::ApplicationController
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])

    if current_user
      @reservation = @restaurant.reservations.build
    end
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to admin_restaurants_url
    else
      render :new
    end
  end

  def edit
    @restaurant = Restaurant.find(params[:id])
  end

  def update
    @restaurant = Restaurant.find(params[:id])

    if @restaurant.update_attributes(restaurant_params)
      redirect_to admin_restaurant_path(@restaurant)
    else
      render :edit
    end
  end

  def destroy
    @restaurant = Restaurant.find(params[:id])
    @restaurant.destroy
    redirect_to admin_restaurants_path
  end

  private
  def restaurant_params
    params.require(:restaurant).permit(:address, :city, :name, :phone_number, :menu_url, :picture_url, :capacity, :cuisine)
  end
end