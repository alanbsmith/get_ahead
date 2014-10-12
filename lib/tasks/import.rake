require 'csv'

desc "Import headstart programs from csv file"
task :import => [:environment] do

  file = "db/head_start_programs.csv"

  CSV.foreach(file, :headers => true) do |row|
    Program.create({
      :longitude       => row[0],
      :latitude        => row[1],
      :facility_name   => row[3],
      :street_address1 => row[7],
      :street_address2 => row[8],
      :city            => row[9],
      :state           => row[10],
      :zipcode         => row[11],
      :phone           => row[12],
      :ext             => row[13],
      :fax             => row[14],
      :program_type    => row[16],
      :enrollment      => row[17],
      
    })
  end

end
