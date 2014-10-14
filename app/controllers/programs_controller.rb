class ProgramsController < ApplicationController
  include ProgramsHelper

  def new
    @program = Program.new
  end

  def create
    @program = Program.new(program_params)

    if @program.save
      redirect_to program_path(@program)
    else
      render :new
    end
  end

  def index
    @programs = Program.all
    @hash = Gmaps4rails.build_markers(@programs) do |program, marker|
      marker.lat program.latitude
      marker.lng program.longitude
    end
  end

  def show
    @program      = Program.find(params[:id])
    @favorite     = favorite
    @notification = Notification.new
  end

  def update
    @program = Program.find(params[:id])
    @program.update(program_params)
    redirect_to :back, notice: "Your program has been successfully updated"
  end

  def claim_your
    @notification = Notification.new
    @getahead = "a.bax.smith@gmail.com"
  end

private

  def program_params
    params.require(:program).permit(:facility_name,
                                    :street_address1,
                                    :street_address2,
                                    :city,
                                    :state,
                                    :zipcode,
                                    :phone,
                                    :ext,
                                    :fax,
                                    :email,
                                    :program_type,
                                    :enrollment,
                                    :description,
                                    :philosophy
                                    )
  end
end