# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
end

require 'movies_api'
require 'products_api'

Dir["#{RAILS_ROOT}/app/models/logical/*.rb"].each { |file|
  require_dependency "logical/#{file[file.rindex('/') + 1...-3]}"
  puts "logical/#{file[file.rindex('/') + 1...-3]}"
}
