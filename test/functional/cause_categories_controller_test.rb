require 'test_helper'

class CauseCategoriesControllerTest < ActionController::TestCase
  setup do
    @cause_category = cause_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cause_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cause_category" do
    assert_difference('CauseCategory.count') do
      post :create, cause_category: { description: @cause_category.description, marker_address: @cause_category.marker_address, name: @cause_category.name }
    end

    assert_redirected_to cause_category_path(assigns(:cause_category))
  end

  test "should show cause_category" do
    get :show, id: @cause_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cause_category
    assert_response :success
  end

  test "should update cause_category" do
    put :update, id: @cause_category, cause_category: { description: @cause_category.description, marker_address: @cause_category.marker_address, name: @cause_category.name }
    assert_redirected_to cause_category_path(assigns(:cause_category))
  end

  test "should destroy cause_category" do
    assert_difference('CauseCategory.count', -1) do
      delete :destroy, id: @cause_category
    end

    assert_redirected_to cause_categories_path
  end
end
