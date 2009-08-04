class CitiesController < ApplicationController
  # GET /cities
  def index
    @cities = City.find_by_mapfish_filter(params)

    render :json => @cities.to_geojson
  end

  # GET /cities/1
  def show
    @city = City.find(params[:id])

    render :json => @city.to_geojson(:only => [:id, :ufi, :admin_code, :mgcc, :name, :attrib, :population, :the_geom])
  end

  # GET /cities/new
  # GET /cities/new.xml
  def new
    @city = City.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @city }
    end
  end

  # GET /cities/1/edit
  def edit
    @city = City.find(params[:id])
  end

  # POST /cities
  # POST /cities.xml
  def create
    params.update(City.params_from_geojson(params))
    @city = City.new(params[:city])

    respond_to do |format|
      if @city.save
        format.json { render :json => @city.to_geojson }
      else
        format.xml  { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cities/1
  # PUT /cities/1.xml
  def update
    params.update(City.params_from_geojson(params))
    @city = City.find(params[:id])
    respond_to do |format|
      if @city.update_attributes(params[:city])
        format.json { render :json => @city.to_geojson }
      else
        format.xml { render :xml => @city.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cities/1
  # DELETE /cities/1.xml
  def destroy
    @city = City.find(params[:id])
    @city.destroy

    respond_to do |format|
      format.html { redirect_to(cities_url) }
      format.xml  { head :ok }
    end
  end
end
