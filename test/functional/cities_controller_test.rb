require 'test_helper'

class CitiesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success    
    #{"type": "FeatureCollection", "features": [{"geometry": {"type": "Point", "coordinates": [-58.6725, -34.5875]}, "type": "Feature", "properties": {"ufi": -979186, "admin_code": 203, "mgcc": 12, "name": "Buenos Aires", "attrib": 131, "population": 12116379}, "id": 8338}, {"geometry": {"type": "Point", "coordinates": [120.9822222, 14.6041667]}, "type": "Feature", "properties": {"ufi": -2437894, "admin_code": 203, "mgcc": 198, "name": "Manila", "attrib": 131, "population": 10232924}, "id": 2616},...
    #{"type": "FeatureCollection", "features": [{"type": "Feature", "properties": {"name": "Bishkek", "admin_code": 203, "ufi": -2331392, "gid": 338, "mgcc": 129, "population": 824895, "attrib": 67}, "geometry": {"type": "Point", "coordinates": [74.6002778, 42.8730556]}, "id": 2815}]}
    assert_not_nil assigns(:cities)
  end

#  def test_should_get_new
#    get :new
#    assert_response :success
#  end

  def test_should_create_city
    assert_difference('City.count') do
      post :create, parse_body('{"properties": {"name": "New City", "gid": 123}}')
    end
    json = ActiveSupport::JSON.decode(@response.body)
    assert_equal 'New City', json['properties']['name']
  end

  def test_should_show_city
    get :show, :id => 8338
    assert_response :success
    json = ActiveSupport::JSON.decode(@response.body)
    #{"geometry": {"type": "Point", "coordinates": [-58.6725, -34.5875]}, "type": "Feature", "properties": {"ufi": -979186, "admin_code": 203, "mgcc": 12, "name": "Buenos Aires", "attrib": 131, "population": 12116379}, "id": 8338}
    assert_equal 'Feature', json['type']
    assert_equal({"type"=>"Point", "coordinates"=>[-58.6725, -34.5875]}, json['geometry'])
    assert_equal({"admin_code"=>203, "name"=>"Buenos Aires", "ufi"=>-979186, "mgcc"=>12, "population"=>12116379, "attrib"=>131}, json['properties'])
    assert_equal 8338, json['id']
  end

#  def test_should_get_edit
#    get :edit, :id => cities(:one).id
#    assert_response :success
#  end
#
  def test_should_update_city
    @item = City.find(8338)
    @item.ufi = 3333
    #json: '{"type": "Feature", "properties": {"name": "Buenos Aires", "admin_code": 203, "ufi": 3333, "mgcc": 12, "population": 12116379, "attrib": 131}, "geometry": {"type": "Point", "coordinates": [-58.6725, -34.5875]}, "id": 8338}'
    put :update, parse_body(@item.to_geojson)
    assert_equal @item.to_geojson, @response.body
  end

  def test_should_destroy_city
    assert_difference('City.count', -1) do
      delete :destroy, :id => 8338
    end

    assert_redirected_to cities_path
  end
  
  private
  
  def parse_body(body)
    env = { 'CONTENT_TYPE' => 'application/json',
            'CONTENT_LENGTH' => body.size.to_s }
    cgi = ActionController::Integration::Session::StubCGI.new(env, body)
    ActionController::CgiRequest.new(cgi).request_parameters
  end

end
