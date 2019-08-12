class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.all.order_by_name
    respond_to do |f|
      f.html{render :index}
      f.json {render json: @restaurants}
    end
  end

  def show
    @restaurant = Restaurant.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @post}
    end
  end
end
