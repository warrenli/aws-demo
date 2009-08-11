require File.dirname(__FILE__) + '/../test_helper'
require 'products_service_controller'

class ProductsServiceController; def rescue_action(e) raise e end; end

class ProductsServiceControllerTest < Test::Unit::TestCase
  def setup
    @controller = ProductsServiceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @p = Physical::Product.create!(
          :name => 'Book - Ruby on Rails',
          :price  => 7.89,
          :quantity => 123
    )
  end

  def test_add_product
    pid = invoke_layered :products_service, :add_product, 
                        "Book - Enterprise Rails", 10.98, 100

    new_product = Physical::Product.find(pid)
    assert_equal "Book - Enterprise Rails", new_product.name
    assert_equal 10.98, new_product.price
    assert_equal 100, new_product.quantity
  end

  def test_get_product
    result = invoke_layered :products_service, :get_product, 'Book - Ruby on Rails'
    assert_equal 7.89, result.price
    assert_equal 123, result.quantity
  end

  def teardown
    @p.destroy
  end
end
