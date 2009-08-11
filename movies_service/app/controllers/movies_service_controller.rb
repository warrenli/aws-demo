class MoviesServiceController < ApplicationController
  web_service_dispatching_mode :layered
  web_service_scaffold :invoke if Rails.env == 'development'
  web_service :movies_service, MoviesService.new
end
