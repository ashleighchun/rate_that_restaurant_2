class ReviewsController < ApplicationController
  #join table method that creates new review that connects user to restaurant

before_action :require_login

  def new
    if @restaurant = Restaurant.find_or_create_by(params[:restaurant_id])
      @review = @restaurant.reviews.build

    else
      @review = Review.new
    end
  end

  #post review submission
  def create
    @review = current_user.reviews.build(review_params)
      binding.pry
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def index

    @restaurant = Restaurant.find_by_id(params[:restaurant_id])

    @reviews = Review.all

  end

  def show
    @review = Review.find_by(id: params[:id])
    if !@review
      redirect_to reviews_path
    end 
  end

  def edit
    @review = Review.find_by_id(params[:id])
  end

  def update
    @review.update(review_params)
    redirect_to reviews_path(@review)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def review_params
    params.require(:review).permit(:restaurant_id, :content, :rating)
  end

  def require_login
    return head(:forbidden) unless user_signed_in?
  end

end
