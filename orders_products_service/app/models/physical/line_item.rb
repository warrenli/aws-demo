module Physical
  class LineItem < ActiveRecord::Base
    belongs_to :order, :class_name => "Physical::Order"
    belongs_to :product, :class_name => "Physical::Product"

    validates_presence_of :unit_price, :quantity, :order, :product
    validates_numericality_of :unit_price, :greater_than_or_equal_to => 0.0
    validates_numericality_of :quantity, :only_integer => true,
        :greater_than_or_equal_to => 0

    def line_total
      self.unit_price * self.quantity
    end
  end
end
