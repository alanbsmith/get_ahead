class PagesController < ApplicationController
  
  def home
  end

  def map
    @programs = Program.all

    @hash = Gmaps4rails.build_markers(@programs) do |program, marker|
      marker.lat program.latitude
      marker.lng program.longitude
      marker.infowindow program.facility_name
    end
  end
end
