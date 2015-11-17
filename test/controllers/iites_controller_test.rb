require 'test_helper'

class IitesControllerTest < ActionController::TestCase
  setup do
    @iite = iites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:iites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create iite" do
    assert_difference('Iite.count') do
      post :create, iite: { data: @iite.data, edifici_id: @iite.edifici_id, referencia: @iite.referencia }
    end

    assert_redirected_to iite_path(assigns(:iite))
  end

  test "should show iite" do
    get :show, id: @iite
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @iite
    assert_response :success
  end

  test "should update iite" do
    patch :update, id: @iite, iite: { data: @iite.data, edifici_id: @iite.edifici_id, referencia: @iite.referencia }
    assert_redirected_to iite_path(assigns(:iite))
  end

  test "should destroy iite" do
    assert_difference('Iite.count', -1) do
      delete :destroy, id: @iite
    end

    assert_redirected_to iites_path
  end
end
