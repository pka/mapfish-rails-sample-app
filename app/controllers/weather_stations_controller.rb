class WeatherStationsController < ApplicationController

  SRID = WeatherStation.geometry_column.srid

  # GET /weather_stations
  def index
    @weather_stations = WeatherStation.find_by_mapfish_filter(params)

    render :json => @weather_stations.to_geojson
  end

  # GET /weather_stations/1
  def show
    @weather_station = WeatherStation.find(params[:id])

    render :json => [@weather_station].to_geojson
  end

  # POST /weather_stations
  def create
    @weather_stations = []
    feature_collection = Geometry.from_geojson(request.raw_post, SRID)
    if feature_collection.nil?
      head :bad_request
      return
    end

    feature_collection.features.each do |feature|
      if feature.id.is_a? Integer
        weather_station = WeatherStation.find_by_id(feature.id)
      end
      if weather_station.nil?
        weather_station = WeatherStation.new()
      end

      if weather_station.update_attributes_from_feature(feature)
        @weather_stations << weather_station
      end
    end

    render :json => @weather_stations.to_geojson, :status => :created
  end

  # PUT /weather_stations/1
  def update
    feature = Geometry.from_geojson(request.raw_post, SRID)
    if feature.nil?
      head :bad_request
      return
    end

    if feature.id.is_a? Integer
      @weather_station = WeatherStation.find_by_id(feature.id)
    end
    if @weather_station.nil?
      head :not_found
      return
    end

    if @weather_station.update_attributes_from_feature(feature)
      render :json => @weather_station.to_geojson, :status => :created
    else
      head :unprocessable_entity
    end
  end

  # DELETE /weather_stations/1
  def destroy
    @weather_station = WeatherStation.find(params[:id])
    @weather_station.destroy

    head :no_content
  end

end
