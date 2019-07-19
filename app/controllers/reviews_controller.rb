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
      binding.pry
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def index
    if params[:restaurant_id] && restaurant = Restaurant.find_by_id(params[:restaurant_id])
      #nested route
      @reviews = restaurant.reviews
    else
      if params[:rating]
        @reviews = Review.search_by_rating(params[:rating]).order_by_rating.includes(:restaurant, :user)
        @reviews = Review.order_by_rating if @reviews == []
      else
        @reviews = Review.includes(:restaurant, :user).order_by_rating
      end 

    end


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
    params.require(:review).permit(:content, :rating, :restaurant_id, restaurant_attributes: [:name, :location, :cuisine, :price])
  end

  def require_login
    return head(:forbidden) unless user_signed_in?
  end

end
