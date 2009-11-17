class CreateWeatherStations < ActiveRecord::Migration
  def self.up
    create_table :weather_stations do |t|
      t.string :name
      t.point :geom
    end
  end

  def self.down
    drop_table :weather_stations
  end
end
