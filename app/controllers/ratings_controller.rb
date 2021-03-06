class RatingsController < ApplicationController

  def new
    @rating = Rating.new
  end

  def create
    @rating = Rating.new(rating_params)

    if @rating.save
      redirect_to :back, notice: "Your PDF has been uploaded!"
    else
      redirect_to :back, alert: "There was a problem uploading your PDF."
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:program_id, :name, :attachment)
  end

end