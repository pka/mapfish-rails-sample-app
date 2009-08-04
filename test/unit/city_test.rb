require 'test_helper'

class CityTest < ActiveSupport::TestCase
  
  def test_geometry_column
    assert_equal 'the_geom', City.geometry_column.name
    assert_equal 4326, City.geometry_column.srid
    assert_equal :point, City.geometry_column.geometry_type
  end
  
  def test_finder
    #point/distance
    cities = City.find_by_mapfish_filter({"name"=>"", "lon"=>"6.021728515625", "max"=>"", "action"=>"index", "maxfeatures"=>"10", "tolerance"=>"10.06591796875", "controller"=>"summits", "min"=>"", "lat"=>"46.07666015625"}, :order => "id")
    assert_equal 7, cities.size
    assert_equal 'Bern', cities.first.name
    
    #box
    cities = City.find_by_mapfish_filter("name"=>"", "box"=>"9.449463,46.593018,10.460205,47.93335", "max"=>"", "action"=>"index", "maxfeatures"=>"10", "controller"=>"summits", "min"=>"")
    assert_equal 1, cities.size
    assert_equal 'Vaduz', cities.first.name
    
    #Attribute filter
    cities = City.find_by_mapfish_filter("name"=>"Vaduz", "lon"=>"6.021728515625", "max"=>"", "action"=>"index", "maxfeatures"=>"10", "tolerance"=>"10.06591796875", "controller"=>"summits", "min"=>"", "lat"=>"46.07666015625")
    assert_equal 1, cities.size
    assert_equal 'Vaduz', cities.first.name
    
    #Custom filter
    cities = City.find_by_mapfish_filter({"lon"=>"6.021728515625", "lat"=>"46.07666015625", "tolerance"=>"10.06591796875"}, :conditions => "name LIKE 'V%'")
    assert_equal 1, cities.size
    assert_equal 'Vaduz', cities.first.name
    
  end

end
