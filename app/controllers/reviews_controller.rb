class ReviewsController < ApplicationController
  before_action :set_codeschool
  # main index
  def index
    render json: {
      meta: {
        count: @codeschool.reviews.count,
        page: 0
      },
      reviews: @codeschool.reviews.all.order(:created_at)
    }
  end

  # singular show page
  def show
    review = @codeschool.reviews.find(params[:id])
    render json: { review: review }
  end


  # create methode
  def create
    review = Review.new(review_params)
    review.codeschool = @codeschool

    if review.save
      render json: { review: review }
    else
      render json: {
        message: 'Could not create a new review',
        errors: review.errors
      }, status: :unprocessible_entity
    end
  end

  # update methode
  def update
    review = @codeschool.reviews.find(params[:id])

    if review.update(review_params)
      render json: { review: review }
    else
      render json: {
        message: 'Could not update the review',
        errors: review.errors
      }, status: :unprocessible_entity
    end
  end

  # destroy methode

  def destroy
    review = @codeschool.reviews.find(params[:id])
    if review.destroy
      render json: { review: nil }
    else
      render json: {
        message: 'Could not destroy the review, please try again'
      }, status: :unprocessible_entity
    end
  end

  # private params area
  private

  def average_rating
    Review.average(:rating)
  end

  def set_codeschool
    @codeschool = Codeschool.find(params[:codeschool_id])
  end

  def review_params
    params.require(:review).permit(:name, :description, :rating, :codeschool_id)
  end
end
