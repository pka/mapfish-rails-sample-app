require 'test_helper'

class SummitsControllerTest < ActionController::TestCase

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:summits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create summit" do
    assert_difference('Summit.count') do
      post :create, :summit => { }
    end

    assert_redirected_to summit_path(assigns(:summit))
  end

  test "should show summit" do
    get :show, :id => summits(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => summits(:one).to_param
    assert_response :success
  end

  test "should update summit" do
    put :update, :id => summits(:one).to_param, :summit => { }
    assert_redirected_to summit_path(assigns(:summit))
  end

  test "should destroy summit" do
    assert_difference('Summit.count', -1) do
      delete :destroy, :id => summits(:one).to_param
    end

    assert_redirected_to summits_path
  end
end
