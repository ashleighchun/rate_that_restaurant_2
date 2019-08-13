class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order_by_name
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @restaurant.to_json }
    end
  end
end
