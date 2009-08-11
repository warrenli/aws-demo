puts 'Loading Logical Models'
puts '* Logical::Movie ...  '
puts '* Logical::Address ...  '
puts '* Logical::Theatre ...  '
puts '* Logical::MovieShowtime ...  '

module Logical
  class Movie < ActionWebService::Struct
    member :id,                 :int
    member :name,               :string
    member :length_minutes,     :int
    member :rating_name,        :string
    member :rating_description, :string
  end

  class Address < ActionWebService::Struct
    member :street_1,   :string
    member :street_2,   :string
    member :city,       :string
    member :zip_code,   :string
    member :country,    :string
  end

  class Theatre < ActionWebService::Struct
    member :id,         :int
    member :name,       :string
    member :address,    Address
  end

  class MovieShowtime < ActionWebService::Struct
    member :movie,      Movie
    member :theatre,    Theatre
    member :start_time, :datetime
    member :auditorium, :string
  end
end

class MoviesApi < ActionWebService::API::Base
  inflect_names false

  api_method( :get_movie,
              :expects => [:movie_id => :int],
              :returns => [:movie => Logical::Movie])

  api_method( :get_theatre,
              :expects => [:theatre_id => :int],
              :returns => [:theatre => Logical::Theatre])

end


