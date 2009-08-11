class InitialData < ActiveRecord::Migration
  def self.up
    g = Physical::Rating.create do |r|
      r.name = 'G'
      r.description = 'General audiences'
    end
    pg = Physical::Rating.create do |r|
      r.name = 'PG'
      r.description = 'Parental guidance suggested'
    end
    pg13 = Physical::Rating.create do |r|
      r.name = 'PG-13'
      r.description = 'Parents strongly cautioned'
    end
    r = Physical::Rating.create do |r|
      r.name = 'R'
      r.description = 'Rstricted'
    end
    nc17 = Physical::Rating.create do |r|
      r.name = 'NC-17'
      r.description = 'No oneunder 17 admitted'
    end
    unrated = Physical::Rating.create do |r|
      r.name = 'Unrated'
      r.description = 'This movie has not been rated'
    end

    cas = Physical::Movie.create do |m|
      m.name = 'Casablanca'
      m.length_minutes = 120
      m.rating = Physical::Rating.find_by_name('Unrated')
      # m.rating = Physical::Rating::UNRATED
    end

    st = Physical::Theatre.create do |t|
      t.name = 'Steller Theatre'
    end
    st.create_address(:street_1 => "Street 123", :city =>"New York", :zip_code => "1234", :country => "USA")

    aud = Physical::Auditorium.create do |a|
      a.theatre = st
      a.room = 'A'
      a.seats_available = 150
    end
    # st.auditoria.create(:room => 'A', :seats_available =>150)
    # st.auditoria.create(:room => 'B', :seats_available =>150)

    movie_st = Physical::MovieShowtime.create do |mst|
      mst.movie = cas
      mst.theatre = st
      mst.auditorium = aud
      mst.start_time = Time.now
    end
  end


  def self.down
    Physical::Rating.destroy_all
    Physical::MovieShowtime.destroy_all
    Physical::Auditorium.destroy_all
    Physical::Theatre.destroy_all
    Physical::Movie.destroy_all
  end
end


=begin
    cas = Physical::Movie.create!(
        :name => 'Casablance',
        :length_minutes => 120,
        :rating => Physical::Rating.find_by_name('Unrated')
#        :rating => Physical::Rating::UNRATED
    )

    st = Physical::Theatre.create!(
        :name => 'Steller Theatre',
        :address => Physical::Address.new(:street_1 => "Street 123", 
                     :city =>"New York", 
                     :postal_code => "1234", 
                     :country => "USA")
    )

    aud = Physical::Auditorium.create!(
        :theatre => st,
        :room => 'A',
        :seats_available => 150
    )

    mov_st = Physical::MovieShowtime.create!(
        :movie => cas,
        :theatre => st,
        :auditorium => aud,
        :start_time => Time.now
    )




    cas = Physical::Movie.create do |m|
      m.name = 'Casablanca'
      m.length_minutes = 120
      m.rating = Physical::Rating.find_by_name('Unrated')
      # m.rating = Physical::Rating::UNRATED
    end

    st = Physical::Theatre.create do |t|
      t.name = 'Steller Theatre'
    end
    st.create_address(:street_1 => "Street 123", :city =>"New York", :postal_code => "1234", :country => "USA")

    aud = Physical::Auditorium.create do |a|
      a.theatre = st
      a.room = 'A'
      a.seats_available = 150
    end
    # st.auditoria.create(:room => 'A', :seats_available =>150)
    # st.auditoria.create(:room => 'B', :seats_available =>150)

    movie_st = Physical::MovieShowtime.create do |mst|
      mst.movie = cas
      mst.theatre = st
      mst.auditorium = aud
      mst.start_time = Time.now
    end

=end
