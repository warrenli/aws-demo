module Physical
  class Theatre < ActiveRecord::Base
    has_one :address, :as => :addressable, :dependent => :destroy,
      :class_name => "Physical::Address"
    has_many :auditoria, :dependent => :destroy, :order => "room ASC", 
      :class_name => "Physical::Auditorium"
    has_many :movie_showtimes, :class_name => "Physical::MovieShowtime"

    validates_presence_of :name
    validates_uniqueness_of :name
  end
end
