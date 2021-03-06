require 'singleton'

class MoviesServiceClient
  include Singleton

#  ENDPOINT_URL = "http://localhost:3000/movies_service/api"
#  TIMEOUT_SECONDS = 10

  def initialize
    # URL and TIMEOUT_SECONDS are defined in
    # config/initializers/movies_service_client_config.rb
    @client = ActionWebService::Client::XmlRpc.new(
        MoviesApi, 
        ENDPOINT_URL, 
        {:handler_name => 'movies_service', :timeout => TIMEOUT_SECONDS}
    )
  end

  def method_missing(method, *args)
    # *args can be modified here, logging can take place, etc.
    result = @client.send(method, *args)
    # the result can be modified here, additional logging can take place, etc.
    result
  end

    # this method allows callers to avoid the dot-instance singleton access pattern
  def self.method_missing(method, *args)
    self.instance.send(method, *args)
  end
end
