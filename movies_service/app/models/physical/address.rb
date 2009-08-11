module Physical
  class Address < ActiveRecord::Base
    belongs_to  :addressable, :polymorphic => true

    validates_presence_of :addressable_id, :addressable_type
    validates_presence_of :street_1, :city, :zip_code, :country

    attr_accessible :street_1, :street_2, :city, :zip_code, :country
  end
end
