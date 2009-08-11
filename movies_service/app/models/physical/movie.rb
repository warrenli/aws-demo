module Physical
  class Movie < ActiveRecord::Base
    belongs_to :rating, :class_name => "Physical::Rating"
    has_many :movie_showtimes, :dependent => :destroy, :class_name => "Physical::MovieShowtime"

    validates_presence_of :name, :length_minutes, :rating
    validates_uniqueness_of :name
    validates_length_of :name, :maximum => 256
    validates_numericality_of :length_minutes, :only_integer => true

#    VALID_RATINGS = ['G', 'PG', 'PG-13', 'R', 'NC-17', 'Unrated']

    def validate_length_minutes
      if length_minutes && length_minutes <= 0
        errors.add 'length_minutes', "must be greater than zero"
      end
    end

#    def validate_rating_type
#      if !VALID_RATINGS.include?(rating)
#        errors.add 'rating', 
#          "must be #{VALID_RATINGS[0..-2].join(', ')} or #{VALID_RATINGS[-1]}"
#      end
#    end

    def validate
      validate_length_minutes
#      validate_rating_type
    end
  end
end

