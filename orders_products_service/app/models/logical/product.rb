module Logical
  class Product < ActionWebService::Struct

    def self.get(product_name)
      return nil if !(m = Physical::Product.find_by_name(product_name))
      Logical::Product.new(
            :id         => m.id,
            :name       => m.name,
            :price      => m.price,
            :quantity   => m.quantity)
    end

  end
end
