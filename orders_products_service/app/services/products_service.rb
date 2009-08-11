class ProductsService < ActionWebService::Base
  web_service_api ProductsApi

  def add_product(name, price, quantity)
    p = Physical::Product.create!(
            :name       => name,
            :price      => price,
            :quantity   => quantity
    )
    return p.id
  end

  def get_product(product_name)
    Logical::Product.get(product_name)
  end
end
