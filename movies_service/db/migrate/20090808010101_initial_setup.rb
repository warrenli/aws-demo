class InitialSetup < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string      :type,             :null => true, :limit => 40
      t.integer     :addressable_id,   :null => false
      t.string      :addressable_type, :null => false
      t.string      :street_1,         :null => false
      t.string      :street_2
      t.string      :city,             :null => false
      t.string      :zip_code,         :null => false
      t.string      :country,          :null => false
      t.timestamps
    end

    create_table :ratings do |t|
      t.string      :name,              :null => false
      t.text        :description,       :null => false
      t.timestamps
    end
    add_index(:ratings, :name, :unique => true)

    create_table :movies do |t|
      t.string      :name,              :null => false
      t.integer     :length_minutes,    :null => false
      t.integer     :rating_id,         :null => false
      t.timestamps
    end
    add_index(:movies, :name, :unique => true)
    add_index(:movies, :rating_id)

    create_table :theatres do |t|
      t.string      :name,      :null => false
      t.timestamps
    end
    add_index(:theatres, :name, :unique => true)

    create_table :auditoria, :id => false do |t|
      t.integer     :theatre_id,        :null => false
      t.string      :room,              :null => false
      t.integer     :seats_available,   :null => false, :default => 0
      t.timestamps
    end
    add_index(:auditoria, [:theatre_id, :room], :unique => true)

    create_table :movie_showtimes do |t|
      t.integer     :movie_id,          :null => false
      t.integer     :theatre_id,        :null => false
      t.string      :room,              :null => false
      t.datetime    :start_time,        :null => false
      t.integer     :product_id
      t.timestamps
    end
    add_index(:movie_showtimes, [:movie_id, :theatre_id, :room, :start_time], :unique => true)
    add_index(:movie_showtimes, :movie_id)
    add_index(:movie_showtimes, [:theatre_id, :room])

  end


  def self.down
    drop_table :addresses
    drop_table :ratings
    drop_table :movies
    drop_table :theatres
    drop_table :auditoria
    drop_table :movie_showtimes
  end
end
