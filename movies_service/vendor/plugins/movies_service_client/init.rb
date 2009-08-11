require 'movies_service_client'

%w{ apis }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'lib', dir)
  $LOAD_PATH << path
#  ActiveSupport::Dependencies.load_paths << path
#  ActiveSupport::Dependencies.load_once_paths.delete(path)
end
