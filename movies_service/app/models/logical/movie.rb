module Logical
  class Movie < ActionWebService::Struct

    def self.get(physical_movie_id)
      return nil if !(m = Physical::Movie.find_by_id(physical_movie_id))
      Logical::Movie.new(
            :id                 => m.id,
            :name               => m.name,
            :length_minutes     => m.length_minutes,
            :rating_name        => m.rating.name,
            :rating_description => m.rating.description)
    end

  end
end
