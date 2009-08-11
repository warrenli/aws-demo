module Physical
  class Order < ActiveRecord::Base
    has_many :line_items, :class_name => "Physical::LineItem"
    has_one :credit_card_payment, :class_name => "Physical::CreditCardPayment"

    def confirm!
       self.order_date = Time.now
       self.confirmation_code = Digest::SHA1.hexdigest(self.order_date.to_s)
       self.save
    end

    def total_price
      total = 0.0
      self.line_items.each do |item|
        total += item.line_total
      end
      total
    end

  end
end
