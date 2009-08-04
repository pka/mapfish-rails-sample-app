class SummitsController < ApplicationController

  # GET /summits
  def index
    @summits = Summit.find_by_mapfish_filter(params)

    render :json => @summits.to_geojson
  end

  # GET /summits/1
  # GET /summits/1.xml
  def show
    @summit = Summit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @summit }
    end
  end

  # GET /summits/new
  # GET /summits/new.xml
  def new
    @summit = Summit.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @summit }
    end
  end

  # GET /summits/1/edit
  def edit
    @summit = Summit.find(params[:id])
  end

  # POST /summits
  # POST /summits.xml
  def create
    @summit = Summit.new(params[:summit])

    respond_to do |format|
      if @summit.save
        flash[:notice] = 'Summit was successfully created.'
        format.html { redirect_to(@summit) }
        format.xml  { render :xml => @summit, :status => :created, :location => @summit }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @summit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /summits/1
  # PUT /summits/1.xml
  def update
    @summit = Summit.find(params[:id])

    respond_to do |format|
      if @summit.update_attributes(params[:summit])
        flash[:notice] = 'Summit was successfully updated.'
        format.html { redirect_to(@summit) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @summit.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /summits/1
  # DELETE /summits/1.xml
  def destroy
    @summit = Summit.find(params[:id])
    @summit.destroy

    respond_to do |format|
      format.html { redirect_to(summits_url) }
      format.xml  { head :ok }
    end
  end
end
