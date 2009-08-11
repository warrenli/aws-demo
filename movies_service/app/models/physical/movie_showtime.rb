module Physical
  class MovieShowtime < ActiveRecord::Base
    belongs_to :movie, :class_name => "Physical::Movie"
    belongs_to :theatre, :class_name => "Physical::Theatre"
    belongs_to :auditorium, :foreign_key => [:theatre_id, :room],
        :class_name => "Physical::Auditorium"

    validates_presence_of :start_time, :movie, :theatre, :auditorium

    def before_save
        self.product_id = ProductsServiceClient.add_product(
                            self.movie.name + " " +self.theatre.name, rand(100), 200
                          )
    end
  end
end
