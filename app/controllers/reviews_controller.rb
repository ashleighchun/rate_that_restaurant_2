class ReviewsController < ApplicationController
  #show new review form
  def new
    @review = Review.new
  end

  #post review submission
  def create
    @review = current_user.review.build(review_params)

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
    params.require(:pet).permit(:content, :rating, :restaurant_id)
  end
end
