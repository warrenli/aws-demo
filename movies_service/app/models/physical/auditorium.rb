#require 'composite_primary_key'

module Physical
  class Auditorium < ActiveRecord::Base
    set_primary_keys :theatre_id, :room
    belongs_to :theatre, :class_name => "Physical::Theatre"
    has_many :movie_showtimes, :class_name => "Physical::MovieShowtime"

    validates_presence_of :room, :seats_available, :theatre
    validates_numericality_of :seats_available, :only_integer => true,
        :greater_than_or_equal_to => 0
  end
end

