require File.dirname(__FILE__) + '/../test_helper'
require 'orders_service_controller'

class OrdersServiceController; def rescue_action(e) raise e end; end

class OrdersServiceControllerTest < Test::Unit::TestCase
  def setup
    @controller = OrdersServiceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @prod1 = Physical::Product.create!(
              :name => 'Book one',
              :price  => 7.89,
              :quantity => 123
            )
    @prod2 = Physical::Product.create!(
              :name => 'Book two',
              :price  => 7.38,
              :quantity => 123
            )

    @item1 = Logical::LineItem.new(
              :product_id => @prod1.id,
              :unit_price => 7.07,
              :quantity   => 3
           )
    @item2 = Logical::LineItem.new(
              :product_id => @prod2.id,
              :unit_price => 6.08,
              :quantity   => 5
           )
    @items = [ @item1, @item2 ]

    @payment = Logical::CreditCardPayment.new(
                :card_type          => 'Visa',
                :card_number        => '4010123412341234',
                :expiration_month   => '01',
                :expiration_year    => '2010'
               )
  end

  def test_place_order
    order_placed = invoke_layered :orders_service, :place_order,  @items, @payment

    assert_equal 'Logical::OrderPlaced', order_placed.class.to_s

    order = Physical::Order.find_by_confirmation_code(order_placed.confirmation_code)

    assert_equal order_placed.total_price, order.total_price

    assert_equal @prod1, order.line_items[0].product
    assert_equal @item1.unit_price, order.line_items[0].unit_price
    assert_equal @item1.quantity, order.line_items[0].quantity

    assert_equal @prod2, order.line_items[1].product
    assert_equal @item2.unit_price, order.line_items[1].unit_price
    assert_equal @item2.quantity, order.line_items[1].quantity

    assert_equal @payment.card_type, order.credit_card_payment.card_type
    assert_equal @payment.card_number, order.credit_card_payment.card_number
    assert_equal @payment.expiration_month, order.credit_card_payment.expiration_month
    assert_equal @payment.expiration_year, order.credit_card_payment.expiration_year
  end

  def teardown
    @prod1.destroy
    @prod2.destroy
  end
end
