puts 'Loading Logical Models'
puts '* Logical::Order ...  '

module Logical
  class LineItem < ActionWebService::Struct
    member :product_id,         :int
    member :unit_price,         :float
    member :quantity,           :int
  end

  class CreditCardPayment < ActionWebService::Struct
    member :card_type,          :string
    member :card_number,        :string
    member :expiration_month,   :string
    member :expiration_year,    :string
  end

  class OrderPlaced < ActionWebService::Struct
    member :confirmation_code,  :string
    member :total_price,        :float
  end
end

class OrdersApi < ActionWebService::API::Base
  inflect_names false

  api_method( :place_order,
              :expects => [{:items    => [Logical::LineItem]},
                           {:payment  => Logical::CreditCardPayment   }],
              :returns => [Logical::OrderPlaced])

end
