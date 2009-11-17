class CountriesController < ApplicationController

  SRID = Country.geometry_column.srid

  # GET /countries
  def index
    @countries = Country.find_by_mapfish_filter(params)

    render :json => @countries.to_geojson
  end

  # GET /countries/1
  def show
    @country = Country.find(params[:id])

    render :json => [@country].to_geojson
  end

  # POST /countries
  def create
    @countries = []
    feature_collection = Geometry.from_geojson(request.raw_post, SRID)
    if feature_collection.nil?
      head :bad_request
      return
    end

    feature_collection.features.each do |feature|
      if feature.id.is_a? Integer
        country = Country.find_by_id(feature.id)
      end
      if country.nil?
        country = Country.new()
      end

      if country.update_attributes_from_feature(feature)
        @countries << country
      end
    end

    render :json => @countries.to_geojson, :status => :created
  end

  # PUT /countries/1
  def update
    feature = Geometry.from_geojson(request.raw_post, SRID)
    if feature.nil?
      head :bad_request
      return
    end

    if feature.id.is_a? Integer
      @country = Country.find_by_id(feature.id)
    end
    if @country.nil?
      head :not_found
      return
    end

    if @country.update_attributes_from_feature(feature)
      render :json => @country.to_geojson, :status => :created
    else
      head :unprocessable_entity
    end
  end

  # DELETE /countries/1
  def destroy
    @country = Country.find(params[:id])
    @country.destroy

    head :no_content
  end

end
