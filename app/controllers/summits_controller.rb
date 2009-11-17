class SummitsController < ApplicationController

  SRID = nil #Summit.geometry_column.srid

  # GET /summits
  def index
    @summits = Summit.find_by_mapfish_filter(params)

    render :json => @summits.to_geojson
  end

  # GET /summits/1
  def show
    @summit = Summit.find(params[:id])

    render :json => [@summit].to_geojson
  end

  # POST /summits
  def create
    @summits = []
    feature_collection = Geometry.from_geojson(request.raw_post, SRID)
    if feature_collection.nil?
      head :bad_request
      return
    end

    feature_collection.features.each do |feature|
      if feature.id.is_a? Integer
        summit = Summit.find_by_id(feature.id)
      end
      if summit.nil?
        summit = Summit.new()
      end

      if summit.update_attributes_from_feature(feature)
        @summits << summit
      end
    end

    render :json => @summits.to_geojson, :status => :created
  end

  # PUT /summits/1
  def update
    feature = Geometry.from_geojson(request.raw_post, SRID)
    if feature.nil?
      head :bad_request
      return
    end

    if feature.id.is_a? Integer
      @summit = Summit.find_by_id(feature.id)
    end
    if @summit.nil?
      head :not_found
      return
    end

    if @summit.update_attributes_from_feature(feature)
      render :json => @summit.to_geojson, :status => :created
    else
      head :unprocessable_entity
    end
  end

  # DELETE /summits/1
  def destroy
    @summit = Summit.find(params[:id])
    @summit.destroy

    head :no_content
  end

end
