class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)

    if @review.save
      redirect_to :back, notice: "Your review has been submitted!"
    else
      redirect_to :back, alert: "There was a problem submitting your review"
    end
  end

  private

  def review_params
    params.require(:review).permit(
                                    :title,
                                    :description,
                                    :score,
                                    :program_id,
                                    :user_id
                                  )
  end
end