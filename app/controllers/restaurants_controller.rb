class RestaurantsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @restaurants = Restaurant.all.order_by_name
    respond_to do |format|
      format.html       #if no json renders the index.html view
      format.json { render json: @restaurants }
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    render json: @restaurant
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    if restaurant.save
      render json: restaurant, status: 201
    else
      render json: { errors: restaurant.errors.full_messages }, status: :bad_request
    end
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :location, :cuisine)
  end
end
