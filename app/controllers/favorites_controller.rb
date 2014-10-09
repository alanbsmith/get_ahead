class FavoritesController < ApplicationController
  include SessionsHelper

  def index
    @favorites_list = favorite.programs
  end

  def destroy
  end

  def add_program
    program = Program.find(params[:program_id])
    favorite.programs << program
    if current_user
      favorite.user = current_user
      favorite.save
    end
    redirect_to :back, notice: "#{program.facility_name} has been added to your favorites!"
  end

  def remove_program
    program = Program.find(params[:program_id])
    favorite.remove_program(program)
    redirect_to favorites_path
  end

  private

    def favorite_params
      params.require(:favorite).permit(:user_id, :program_id)
    end
end
