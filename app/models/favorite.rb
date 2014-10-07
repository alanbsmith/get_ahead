class Favorite < ActiveRecord::Base
  belongs_to :user
  has_many :favorite_programs
  has_many :programs, through: :favorite_programs

  def add_program_id(program)
    @favorite.program_id = program.id
  end

  def add_program(program)
    self.programs << program
  end

  def remove_program(program)
    self.programs.delete(program)
  end
end
