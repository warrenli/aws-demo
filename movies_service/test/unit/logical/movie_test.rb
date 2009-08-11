require File.dirname(__FILE__) + '/../../test_helper'

class MovieTest < ActiveSupport::TestCase

    # This is overridden by the subclass and will not be called
  def setup
    Physical::Rating.create!(:name => 'PG-13', :description => 'Testing')
    @p = Physical::Movie.create!(
          :name => 'When Harry Met Sally',
          :length_minutes => 120,
          :rating => Physical::Rating.find_by_name('PG-13')
        )
  end



  def test_logical_movie_get
    l = Logical::Movie.get(@p.id)
    assert l.name == @p.name
    assert l.length_minutes == @p.length_minutes
    assert l.rating_name == @p.rating.name
    assert l.rating_description == @p.rating.description
  end


    # This is overridden by the subclass and will not be called
  def teardown
    @p.destroy
  end

end
