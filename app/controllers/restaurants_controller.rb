class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order_by_name
    render json: @restaurants, status: 200
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

  end
end
