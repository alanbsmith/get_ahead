class ProgramsController < ApplicationController
  include ProgramsHelper

  def index
    @programs = Program.all
    @hash = Gmaps4rails.build_markers(@programs) do |program, marker|
      marker.lat program.latitude
      marker.lng program.longitude
    end
  end

  def show
    @program        = Program.find(params[:id])
    @favorite       = favorite
    @notification   = Notification.new
    @review         = Review.new
    @current_rating = @program.ratings.last
  end

  def claim_your
    @notification = Notification.new
    @getahead = "a.bax.smith@gmail.com"
  end
end