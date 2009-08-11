require File.dirname(__FILE__) + '/../test_helper'

# Setting two constant for this test
#  It can be defined as config/initializer/products_service_client_config.rb
class ProductsServiceClient
  ENDPOINT_URL = "http://localhost:3001/products_service/api"
  TIMEOUT_SECONDS = 10
end



class ShowtimeCreateTest < ActionController::IntegrationTest

  def setup
    puts 'Setup...'
    @r = Physical::Rating.create!(:name => 'PG', :description => 'Testing')
    @m = Physical::Movie.create!(
        :name => 'Hello World',
        :length_minutes => 110,
        :rating => Physical::Rating.find_by_name('PG')
    )
    @t = Physical::Theatre.create!(
        :name => "Grand Theatre"
    )
    @a = Physical::Auditorium.create!(
        :theatre => @t,
        :room => 'GA',
        :seats_available =>300
    )
  end

  def test_create_movie_showtime_get_product_id
    assert true
    ms= Physical::MovieShowtime.create(
        :movie => @m,
        :theatre => @t,
        :auditorium => @a,
        :start_time => Time.now
    )
    assert_not_nil ms
    assert_not_nil ms.product_id
  end

  def teardown
    puts 'Teardown...'
    @a.destroy
    @t.destroy
    @m.destroy
  end
end
