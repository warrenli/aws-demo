module Physical
  class Product < ActiveRecord::Base
    has_many :line_items, :class_name => "Physical::LineItem"

    validates_presence_of :name, :price, :quantity
    validates_uniqueness_of :name
    validates_length_of :name, :maximum => 256
    validates_numericality_of :price, :greater_than_or_equal_to => 0.0
    validates_numericality_of :quantity, :only_integer => true,
        :greater_than_or_equal_to => 0
  end
end

