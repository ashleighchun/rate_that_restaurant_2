class ReviewsController < ApplicationController
  #show new review form
  def new
    @review = Review.new
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
    if params[:rating]
      @reviews = Review.search_by_review(params[:rating]).order_by_rating
      @reviews = Review.order_by_rating if @reviews == []
    else
      @reviews = Review.order_by_rating
    end
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
    params.require(:pet).permit(:content, :rating)
  end
end
