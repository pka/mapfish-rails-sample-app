require 'test_helper'

class WeatherStationsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:weather_stations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create weather_station" do
    assert_difference('WeatherStation.count') do
      post :create, :weather_station => { }
    end

    assert_redirected_to weather_station_path(assigns(:weather_station))
  end

  test "should show weather_station" do
    get :show, :id => weather_stations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => weather_stations(:one).to_param
    assert_response :success
  end

  test "should update weather_station" do
    put :update, :id => weather_stations(:one).to_param, :weather_station => { }
    assert_redirected_to weather_station_path(assigns(:weather_station))
  end

  test "should destroy weather_station" do
    assert_difference('WeatherStation.count', -1) do
      delete :destroy, :id => weather_stations(:one).to_param
    end

    assert_redirected_to weather_stations_path
  end
end
