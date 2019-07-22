class ReviewsController < ApplicationController
  #join table method that creates new review that connects user to restaurant

  before_action :require_login

  def new
    #check if it's nested & it's a proper id
    if params[:restaurant_id] && restaurant = Restaurant.find_by_id(params[:restaurant_id])
      #nested route
      @review = restaurant.reviews.build #has_many
    else
      #unnested
      @review = Review.new
      @review.build_restaurant  #belongs_to
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
    @reviews = Review.all.order_by_rating.select{ |review| review.user_id == current_user.id}
  end

  def show
  set_review
  end

  def edit
    set_review
  end

  def update
    set_review
    if @review.update(review_params)
      redirect_to reviews_path(@review)
    else
      render :edit
    end
  end

  def destroy
    set_review
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end

  private

  def set_review
    @review = Review.find_by(id: params[:id])
    if !@review

      redirect_to reviews_path
    end
  end

  def review_params
    params.require(:review).permit(:title, :content, :rating, :price, :restaurant_id, restaurant_attributes: [:name, :location, :cuisine])
  end

  def require_login
    return head(:forbidden) unless user_signed_in?
  end

end
