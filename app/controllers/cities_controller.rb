class CitiesController < ApplicationController

  SRID = City.geometry_column.srid

  # GET /cities
  def index
    @cities = City.find_by_mapfish_filter(params)

    render :json => @cities.to_geojson
  end

  # GET /cities/1
  def show
    @city = City.find(params[:id])

    render :json => [@city].to_geojson
  end

  # POST /cities
  def create
    @cities = []
    feature_collection = Geometry.from_geojson(request.raw_post, SRID)
    if feature_collection.nil?
      head :bad_request
      return
    end

    feature_collection.features.each do |feature|
      if feature.id.is_a? Integer
        city = City.find_by_id(feature.id)
      end
      if city.nil?
        city = City.new()
      end

      if city.update_attributes_from_feature(feature)
        @cities << city
      end
    end

    render :json => @cities.to_geojson, :status => :created
  end

  # PUT /cities/1
  def update
    feature = Geometry.from_geojson(request.raw_post, SRID)
    if feature.nil?
      head :bad_request
      return
    end

    if feature.id.is_a? Integer
      @city = City.find_by_id(feature.id)
    end
    if @city.nil?
      head :not_found
      return
    end

    if @city.update_attributes_from_feature(feature)
      render :json => @city.to_geojson, :status => :created
    else
      head :unprocessable_entity
    end
  end

  # DELETE /cities/1
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    head :no_content
  end

end
