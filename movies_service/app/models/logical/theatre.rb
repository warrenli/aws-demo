#require 'movies_service'

module Logical
  class Theatre < ActionWebService::Struct

    def self.get(theatre_id)
      p_t = Physical::Theatre.find(theatre_id)
      a = Logical::Address.new(
        :street_1   => p_t.address.street_1,
        :street_2   => p_t.address.street_2,
        :city       => p_t.address.city,
        :zip_code   => p_t.address.zip_code,
        :country    => p_t.address.country)
      Logical::Theatre.new(
        :id         => p_t.id,
        :name       => p_t.name,
        :address    => a)
    end

  end
end

