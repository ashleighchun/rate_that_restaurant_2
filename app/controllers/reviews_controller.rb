class ReviewsController < ApplicationController
  #join table method that creates new review that connects user to restaurant
  


  def new
    if @restaurant = Restaurant.find_by_id(params[:restaurant_id])
      @review = @restaurant.reviews.build
    else
      @review = Review.new
    end
  end

  #post review submission
  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find_by_id(params[:id])
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
    params.require(:review).permit(:restaurant_id, :content, :rating)
  end
end
