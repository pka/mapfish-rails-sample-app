# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20091117213647) do

  create_table "lines", :force => true do |t|
    t.column "name", :string, :limit => nil, :default => "foo"
    t.column "the_geom", :line_string, :srid => 4326
  end

  add_index "lines", ["id"], :name => "lines_id_idx"
  add_index "lines", ["the_geom"], :name => "lines_the_geom_index", :spatial=> true 

  create_table "parkings", :primary_key => "parking_id", :force => true do |t|
    t.column "name", :string, :limit => 100
    t.column "elevation", :integer
    t.column "range_id", :integer
    t.column "lat", :float
    t.column "long", :float
    t.column "country_id", :string, :limit => 2
    t.column "source", :integer
    t.column "x", :integer
    t.column "y", :integer
    t.column "blur", :boolean
    t.column "the_geom", :point, :srid => 32768
  end

  create_table "parkings_out", :id => false, :force => true do |t|
    t.column "parking_id", :integer, :null => false
    t.column "name", :string, :limit => 100
    t.column "elevation", :integer
    t.column "range_id", :integer
    t.column "lat", :float
    t.column "long", :float
    t.column "country_id", :string, :limit => 2
    t.column "source", :integer
    t.column "blur", :boolean
    t.column "geom", :point, :srid => 32768
  end

  add_index "parkings_out", ["geom"], :name => "parkings_out_geom_1179163421750", :spatial=> true 

  create_table "points", :force => true do |t|
    t.column "name", :string, :limit => nil, :default => "foo"
    t.column "the_geom", :point, :srid => 4326
  end

  add_index "points", ["id"], :name => "points_id_idx"
  add_index "points", ["the_geom"], :name => "points_the_geom_index", :spatial=> true 

  create_table "polygons", :force => true do |t|
    t.column "name", :string, :limit => nil, :default => "foo"
    t.column "the_geom", :polygon, :srid => 4326
  end

  add_index "polygons", ["id"], :name => "polygons_id_idx"
  add_index "polygons", ["the_geom"], :name => "polygons_the_geom_index", :spatial=> true 

  create_table "refuges", :primary_key => "refuge_id", :force => true do |t|
    t.column "id", :integer
    t.column "name", :string, :limit => 100
    t.column "elevation", :integer
    t.column "region_id", :integer
    t.column "lat", :float
    t.column "long", :float
    t.column "country_id", :string, :limit => 2
    t.column "range_id", :integer
    t.column "source", :integer
    t.column "x", :integer
    t.column "y", :integer
    t.column "blur", :boolean
    t.column "the_geom", :point, :srid => 32768
  end

  create_table "refuges_out", :force => true do |t|
    t.column "refuge_id", :integer, :null => false
    t.column "name", :string, :limit => 100
    t.column "elevation", :integer
    t.column "region_id", :integer
    t.column "lat", :float
    t.column "long", :float
    t.column "country_id", :string, :limit => 2
    t.column "range_id", :integer
    t.column "source", :integer
    t.column "blur", :boolean
    t.column "geom", :point, :srid => 32768
  end

  add_index "refuges_out", ["geom"], :name => "refuges_out_geom_1179163421250", :spatial=> true 

  create_table "sites", :primary_key => "site_id", :force => true do |t|
    t.column "id", :integer
    t.column "name", :string, :limit => 100
    t.column "country_id", :string, :limit => 2
    t.column "region_id", :integer
    t.column "lat", :float
    t.column "long", :float
    t.column "lambertx", :integer
    t.column "lamberty", :integer
    t.column "source", :integer
    t.column "x", :integer
    t.column "y", :integer
    t.column "blur", :boolean
    t.column "the_geom", :point, :srid => 32768
  end

# Could not dump table "sites_out" because of following StandardError
#   Unknown type 'real' for column 'lambertx' /tmp/MyMapFishProject/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:44:in `table'/tmp/MyMapFishProject/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:42:in `each'/tmp/MyMapFishProject/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:42:in `table'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:72:in `tables'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:63:in `each'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:63:in `tables'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:25:in `dump'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:19:in `dump'/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:260/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:259:in `open'/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:259/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `call'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `each'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:578:in `invoke_with_call_chain'/usr/lib/ruby/1.8/monitor.rb:242:in `synchronize'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:571:in `invoke_with_call_chain'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:564:in `invoke'/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:117/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `call'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `each'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:578:in `invoke_with_call_chain'/usr/lib/ruby/1.8/monitor.rb:242:in `synchronize'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:571:in `invoke_with_call_chain'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:564:in `invoke'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:2019:in `invoke_task'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `top_level'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `each'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `top_level'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:2036:in `standard_exception_handling'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1991:in `top_level'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1970:in `run'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:2036:in `standard_exception_handling'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1967:in `run'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/bin/rake:31/usr/bin/rake:19:in `load'/usr/bin/rake:19

  create_table "sommets", :primary_key => "sommet_id", :force => true do |t|
    t.column "id", :integer
    t.column "name", :string, :limit => 100
    t.column "elevation", :integer
    t.column "region_id", :integer
    t.column "x", :integer
    t.column "y", :integer
    t.column "lat", :float
    t.column "long", :float
    t.column "gps", :string, :limit => 100
    t.column "source", :integer
    t.column "blur", :boolean
    t.column "the_geom", :point, :srid => 32768
  end

# Could not dump table "sommets_out" because of following StandardError
#   Unknown type 'real' for column 'x' /tmp/MyMapFishProject/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:44:in `table'/tmp/MyMapFishProject/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:42:in `each'/tmp/MyMapFishProject/vendor/plugins/spatial_adapter/lib/common_spatial_adapter.rb:42:in `table'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:72:in `tables'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:63:in `each'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:63:in `tables'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:25:in `dump'/usr/lib/ruby/gems/1.8/gems/activerecord-2.3.4/lib/active_record/schema_dumper.rb:19:in `dump'/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:260/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:259:in `open'/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:259/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `call'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `each'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:578:in `invoke_with_call_chain'/usr/lib/ruby/1.8/monitor.rb:242:in `synchronize'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:571:in `invoke_with_call_chain'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:564:in `invoke'/usr/lib/ruby/gems/1.8/gems/rails-2.3.4/lib/tasks/databases.rake:117/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `call'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:617:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `each'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:612:in `execute'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:578:in `invoke_with_call_chain'/usr/lib/ruby/1.8/monitor.rb:242:in `synchronize'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:571:in `invoke_with_call_chain'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:564:in `invoke'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:2019:in `invoke_task'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `top_level'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `each'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1997:in `top_level'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:2036:in `standard_exception_handling'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1991:in `top_level'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1970:in `run'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:2036:in `standard_exception_handling'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/lib/rake.rb:1967:in `run'/usr/lib/ruby/gems/1.8/gems/rake-0.8.3/bin/rake:31/usr/bin/rake:19:in `load'/usr/bin/rake:19

  create_table "weather_stations", :force => true do |t|
    t.column "name", :string
    t.column "geom", :point
  end

  create_table "world_cities", :primary_key => "gid", :force => true do |t|
    t.column "id", :integer
    t.column "attrib", :integer
    t.column "mgcc", :integer
    t.column "admin_code", :integer
    t.column "ufi", :integer
    t.column "population", :integer
    t.column "name", :string, :limit => 250
    t.column "the_geom", :point, :srid => 4326
  end

  add_index "world_cities", ["the_geom"], :name => "world_cities_the_geom_gist", :spatial=> true 

  create_table "world_factbk_simplified", :id => false, :force => true do |t|
    t.column "gid", :integer, :null => false
    t.column "polyid", :integer
    t.column "fips10", :string, :limit => 3
    t.column "country", :string, :limit => 44
    t.column "continent", :string, :limit => 13
    t.column "area", :integer
    t.column "population", :integer
    t.column "birth_rt", :float
    t.column "death_rt", :float
    t.column "inf_mort", :float
    t.column "life_exp", :float
    t.column "fertility", :float
    t.column "hivaidpct", :float
    t.column "hivaidppl", :integer
    t.column "hivaiddth", :integer
    t.column "gdp", :integer
    t.column "gdp_grow", :float
    t.column "gdp_pc", :integer
    t.column "labor_frc", :integer
    t.column "unemploy", :float
    t.column "inflation", :float
    t.column "invst_pct", :float
    t.column "pub_debt", :float
    t.column "indprd_gr", :float
    t.column "elec_prd", :integer
    t.column "elec_con", :integer
    t.column "oil_prod", :integer
    t.column "oil_cons", :integer
    t.column "oil_exp", :integer
    t.column "oil_imp", :integer
    t.column "oil_res", :integer
    t.column "ngas_prd", :integer
    t.column "ngas_cons", :integer
    t.column "ngas_exp", :integer
    t.column "ngas_imp", :integer
    t.column "ngas_res", :integer
    t.column "cur_acct", :integer
    t.column "exports", :integer
    t.column "imports", :integer
    t.column "forgn_exc", :integer
    t.column "ext_debt", :integer
    t.column "telephone", :integer
    t.column "cellphones", :integer
    t.column "inet_host", :integer
    t.column "intrnetu", :integer
    t.column "airports", :integer
    t.column "railways", :integer
    t.column "roadways", :integer
    t.column "waterways", :integer
    t.column "mrct_mrn", :integer
    t.column "mil_exp", :integer
    t.column "gdp_milp", :float
    t.column "simplify", :multi_polygon
  end

  add_index "world_factbk_simplified", ["simplify"], :name => "world_factbk_simplified_simplify_idx", :spatial=> true 

end
