class ProgramsController < ApplicationController
  include ProgramsHelper

  def index
    @programs = Program.all
  end

  def show
    @program = Program.find(params[:id])
  end
end
