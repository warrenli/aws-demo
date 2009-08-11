class OrdersService < ActionWebService::Base
  web_service_api OrdersApi

  def place_order(items, payment)
    order = Physical::Order.create!

    items.each do |i|
      line = Physical::LineItem.new(
                :product    => Physical::Product.find(i.product_id),
                :unit_price => i.unit_price,
                :quantity   => i.quantity
            )
      order.line_items << line
    end

    p = Physical::CreditCardPayment.new(
      :card_type        => payment.card_type,
      :card_number      => payment.card_number,
      :expiration_month => payment.expiration_month,
      :expiration_year  => payment.expiration_year
    )
    order.credit_card_payment = p

    order.confirm!

    Logical::OrderPlaced.new(
      :confirmation_code => order.confirmation_code,
      :total_price       => order.total_price
    )
  end
end

