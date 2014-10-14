class FavoritesController < ApplicationController
  include SessionsHelper

  def index
    @favorites_list = favorite.programs
  end

  def add_program
    program = Program.find(params[:program_id])
    if already_a_favorite(program)
      redirect_to :back, alert: "You've already favorited #{program.facility_name}."
    else
      favorite.programs << program
    
      if current_user
        favorite.user = current_user
        favorite.save
      end
      redirect_to :back, notice: "#{program.facility_name} has been added to your favorites!"
    end
  end

  def remove_program
    program = Program.find(params[:program_id])
    favorite.remove_program(program)
    redirect_to favorites_path
  end

  private

    def already_a_favorite(program)
      favorite.programs.include?(program)
    end

    def favorite_params
      params.require(:favorite).permit(:user_id, :program_id)
    end
end
