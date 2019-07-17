class ReviewsController < ApplicationController
  #join table method that creates new review that connects user to restaurant
  def new
    @review =
    if params[:user_id] && user = User.find_by_id(params[:user_id])
      @review = User.reviews.build
    else
      @review = Review.new
    end
  end

  #post review submission
  def create
    @restaurant = Restaurant.find_or_create(review_params[:restaurant_id])
    @restaurant.reviews.create(review_params)
    #redirect_to 
  end

  def index
    @reviews = Review.all
  end

  def show
    set_review
  end

  def edit
    set_review
  end

  def set_review
    @review = Review.find_by(id: params[:id])
    if !@review
      redirect_to reviews_path
    end
  end

  def review_params
    params.require(:review).permit(:content, :rating, :user, :user_id, :restaurant_id, :restaurant)
  end
end
