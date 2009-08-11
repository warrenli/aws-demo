class MoviesService < ActionWebService::Base
  web_service_api MoviesApi

  def get_movie(movie_id)
    Logical::Movie.get(movie_id)
  end

  def get_theatre(theatre_id)
    Logical::Theatre.get(theatre_id)
  end
end
