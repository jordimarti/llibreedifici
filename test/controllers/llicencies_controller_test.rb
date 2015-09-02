require 'test_helper'

class LlicenciesControllerTest < ActionController::TestCase
  setup do
    @llicencia = llicencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:llicencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create llicencia" do
    assert_difference('Llicencia.count') do
      post :create, llicencia: { classe: @llicencia.classe, data_llicencia: @llicencia.data_llicencia, edifici_id: @llicencia.edifici_id }
    end

    assert_redirected_to llicencia_path(assigns(:llicencia))
  end

  test "should show llicencia" do
    get :show, id: @llicencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @llicencia
    assert_response :success
  end

  test "should update llicencia" do
    patch :update, id: @llicencia, llicencia: { classe: @llicencia.classe, data_llicencia: @llicencia.data_llicencia, edifici_id: @llicencia.edifici_id }
    assert_redirected_to llicencia_path(assigns(:llicencia))
  end

  test "should destroy llicencia" do
    assert_difference('Llicencia.count', -1) do
      delete :destroy, id: @llicencia
    end

    assert_redirected_to llicencies_path
  end
end
