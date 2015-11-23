require 'test_helper'

class ImportatsControllerTest < ActionController::TestCase
  setup do
    @importat = importats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:importats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create importat" do
    assert_difference('Importat.count') do
      post :create, importat: { edifici_id: @importat.edifici_id }
    end

    assert_redirected_to importat_path(assigns(:importat))
  end

  test "should show importat" do
    get :show, id: @importat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @importat
    assert_response :success
  end

  test "should update importat" do
    patch :update, id: @importat, importat: { edifici_id: @importat.edifici_id }
    assert_redirected_to importat_path(assigns(:importat))
  end

  test "should destroy importat" do
    assert_difference('Importat.count', -1) do
      delete :destroy, id: @importat
    end

    assert_redirected_to importats_path
  end
end
