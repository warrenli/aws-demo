module Physical
  class Rating < ActiveRecord::Base
    validates_presence_of :name, :description
    validates_uniqueness_of :name
    validates_length_of :name, :maximum => 16

    G       = Physical::Rating.find_by_name('G')
    PG      = Physical::Rating.find_by_name('PG')
    PG13    = Physical::Rating.find_by_name('PG-13')
    R       = Physical::Rating.find_by_name('R')
    NC17    = Physical::Rating.find_by_name('NC-17')
    UNRATED = Physical::Rating.find_by_name('Unrated')

  end
end
