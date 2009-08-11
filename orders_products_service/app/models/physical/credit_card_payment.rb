module Physical
  class CreditCardPayment < ActiveRecord::Base
    belongs_to :order, :class_name => "Physical::Order"

    validates_presence_of :card_type, :card_number, :expiration_month, :expiration_year, :order

    CARD_TYPES = ['Visa', 'MasterCard', 'Amex']
    def validate_card_type
        return true if CARD_TYPES.include?(card_type)
        errors.add('card_type',  "must be #{CARD_TYPES[0..-2].join(', ')} or #{CARD_TYPES[-1]}")
    end

    MONTHS = 01..12
    def validate_month
        return true if MONTHS.include?(self.expiration_month.to_i)
        errors.add('expiration_month',  "must between #{MONTHS.to_s}")
    end

    YEARS = 2009..2020
    def validate_year
        return true if YEARS.include?(self.expiration_year.to_i)
        errors.add('expiration_year',  "must between #{YEARS.to_s}")
    end

    def validate
      validate_card_type
      validate_month
      validate_year
    end
  end
end

