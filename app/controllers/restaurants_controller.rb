class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order_by_name
    respond_to do |format|
      format.html       #if no json renders the index.html view
      #binding.pry
      format.json { render json: @restaurants }
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])

  end
end
