class Program < ActiveRecord::Base
  belongs_to :user
  has_many   :ratings
  has_many   :reviews
  has_many   :favorite_programs
  has_many   :favorites, through: :favorite_programs

end
