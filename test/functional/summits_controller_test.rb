require 'test_helper'

class SummitsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:summits)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_summit
    assert_difference('Summit.count') do
      post :create, :summit => { }
    end

    assert_redirected_to summit_path(assigns(:summit))
  end

  def test_should_show_summit
    get :show, :id => summits(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => summits(:one).id
    assert_response :success
  end

  def test_should_update_summit
    put :update, :id => summits(:one).id, :summit => { }
    assert_redirected_to summit_path(assigns(:summit))
  end

  def test_should_destroy_summit
    assert_difference('Summit.count', -1) do
      delete :destroy, :id => summits(:one).id
    end

    assert_redirected_to summits_path
  end
end
