require 'products_service_client'

%w{ apis }.each do |dir|
  path = File.join(File.dirname(__FILE__), 'lib', dir)
  $LOAD_PATH << path
end
