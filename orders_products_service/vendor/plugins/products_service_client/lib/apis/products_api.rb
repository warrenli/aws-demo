puts 'Loading Logical Models'
puts '* Logical::Product ...  '

module Logical
  class Product < ActionWebService::Struct
    member :id,         :int
    member :name,       :string
    member :price,      :float
    member :quantity,   :int
  end
end

class ProductsApi < ActionWebService::API::Base
  inflect_names false

  api_method( :add_product,
              :expects => [{:name      => :string},
                           {:price     => :float},
                           {:quantity  => :int}],
              :returns => [:product_id => :int])

  api_method( :get_product,
              :expects => [:product_name => :string],
              :returns => [:product => Logical::Product])

end
