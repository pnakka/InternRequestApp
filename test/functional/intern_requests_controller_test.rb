require 'test_helper'

class InternRequestsControllerTest < ActionController::TestCase
  setup do
    @intern_request = intern_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:intern_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create intern_request" do
    assert_difference('InternRequest.count') do
      post :create, intern_request: { EndDate: @intern_request.EndDate, EndHour: @intern_request.EndHour, EveningMeetingsPercent: @intern_request.EveningMeetingsPercent, InternProjectDesc: @intern_request.InternProjectDesc, InternProvisionEmail: @intern_request.InternProvisionEmail, InternProvisionPhone: @intern_request.InternProvisionPhone, OfficeDutiesPercent: @intern_request.OfficeDutiesPercent, OutFieldWorkPercent: @intern_request.OutFieldWorkPercent, StartDate: @intern_request.StartDate, StartHour: @intern_request.StartHour, WeekendWorkPercent: @intern_request.WeekendWorkPercent }
    end

    assert_redirected_to intern_request_path(assigns(:intern_request))
  end

  test "should show intern_request" do
    get :show, id: @intern_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @intern_request
    assert_response :success
  end

  test "should update intern_request" do
    put :update, id: @intern_request, intern_request: { EndDate: @intern_request.EndDate, EndHour: @intern_request.EndHour, EveningMeetingsPercent: @intern_request.EveningMeetingsPercent, InternProjectDesc: @intern_request.InternProjectDesc, InternProvisionEmail: @intern_request.InternProvisionEmail, InternProvisionPhone: @intern_request.InternProvisionPhone, OfficeDutiesPercent: @intern_request.OfficeDutiesPercent, OutFieldWorkPercent: @intern_request.OutFieldWorkPercent, StartDate: @intern_request.StartDate, StartHour: @intern_request.StartHour, WeekendWorkPercent: @intern_request.WeekendWorkPercent }
    assert_redirected_to intern_request_path(assigns(:intern_request))
  end

  test "should destroy intern_request" do
    assert_difference('InternRequest.count', -1) do
      delete :destroy, id: @intern_request
    end

    assert_redirected_to intern_requests_path
  end
end
