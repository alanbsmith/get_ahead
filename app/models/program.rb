class Program < ActiveRecord::Base
  has_many :favorite_programs
  has_many :favorites, through: :favorite_programs

end
