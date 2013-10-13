require 'test_helper'

class InternshipLocationsControllerTest < ActionController::TestCase
  setup do
    @internship_location = internship_locations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:internship_locations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create internship_location" do
    assert_difference('InternshipLocation.count') do
      post :create, internship_location: { Phone: @internship_location.Phone }
    end

    assert_redirected_to internship_location_path(assigns(:internship_location))
  end

  test "should show internship_location" do
    get :show, id: @internship_location
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @internship_location
    assert_response :success
  end

  test "should update internship_location" do
    put :update, id: @internship_location, internship_location: { Phone: @internship_location.Phone }
    assert_redirected_to internship_location_path(assigns(:internship_location))
  end

  test "should destroy internship_location" do
    assert_difference('InternshipLocation.count', -1) do
      delete :destroy, id: @internship_location
    end

    assert_redirected_to internship_locations_path
  end
end
