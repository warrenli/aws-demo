class ProductsServiceController < ApplicationController
  web_service_dispatching_mode :layered
  web_service_scaffold :invoke if Rails.env == 'development'
  web_service :products_service, ProductsService.new
end
