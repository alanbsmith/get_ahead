class ProgramsController < ApplicationController
  include ProgramsHelper

  def index
    @q = Program.search(params[:q])
    @programs = @q.result(distinct: true)
  end

  def show
    @program = Program.find(params[:id])
  end
end
