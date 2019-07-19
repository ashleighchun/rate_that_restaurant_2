class RestaurantsController < ApplicationController

  def new
    @restaurant = Restaurant.new
  end

  def create
     @restaurant = Restaurant.new(restaurant_params)
     @restaurant.user_id = session[:user_id]

    if @restaurant.save #this is where validations happen
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find_by_id(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :cuisine, :rating)
  end

end
