require 'test_helper'

class BoxOfficesControllerTest < ActionController::TestCase
  setup do
    @box_office = box_offices(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:box_offices)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create box_office" do
    assert_difference('BoxOffice.count') do
      post :create, :box_office => @box_office.attributes
    end

    assert_redirected_to box_office_path(assigns(:box_office))
  end

  test "should show box_office" do
    get :show, :id => @box_office.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @box_office.to_param
    assert_response :success
  end

  test "should update box_office" do
    put :update, :id => @box_office.to_param, :box_office => @box_office.attributes
    assert_redirected_to box_office_path(assigns(:box_office))
  end

  test "should destroy box_office" do
    assert_difference('BoxOffice.count', -1) do
      delete :destroy, :id => @box_office.to_param
    end

    assert_redirected_to box_offices_path
  end
end
