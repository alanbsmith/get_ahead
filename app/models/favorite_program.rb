class FavoriteProgram < ActiveRecord::Base
  belongs_to :favorite
  belongs_to :program
  validates :favorite_id, :program_id, presence: true
end
