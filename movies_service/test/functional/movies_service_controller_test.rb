require File.dirname(__FILE__) + '/../test_helper'
require 'movies_service_controller'

class MoviesServiceController; def rescue_action(e) raise e end; end

class MoviesServiceControllerTest < Test::Unit::TestCase
  def setup
    @controller = MoviesServiceController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new

    @r = Physical::Rating.create!(:name => 'PG-13', :description => 'Testing')
    @m = Physical::Movie.create!(
          :name => 'When Harry Met Sally',
          :length_minutes => 120,
          :rating => Physical::Rating.find_by_name('PG-13')
    )
    @t = Physical::Theatre.create!(
          :name => 'ABC Theatre'
    )
    @t.create_address(:street_1 => "Street 123", :city =>"New York", :zip_code => "1234", :country => "USA")
  end

  def test_get_movie
      result = invoke_layered :movies_service, :get_movie, @m.id
      assert_equal("When Harry Met Sally", result.name)
  end

  def test_get_theatre
      result = invoke_layered :movies_service, :get_theatre, @t.id
      assert_equal("ABC Theatre", result.name)
  end

  def teardown
    @r.destroy
    @m.destroy
    @t.destroy
  end

end
