# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def get_server_path
    host = request.host.to_s
    port = request.port.to_s
    protocol = request.protocol
    serverURL="#{protocol}#{host}"
    serverURL = serverURL + ":#{port}"  unless port == "80"
    serverURL
  end
end
