require 'test_helper'

class ReferenciaCaldendarisControllerTest < ActionController::TestCase
  setup do
    @referencia_caldendari = referencia_caldendaris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referencia_caldendaris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referencia_caldendari" do
    assert_difference('ReferenciaCaldendari.count') do
      post :create, referencia_caldendari: { any: @referencia_caldendari.any, edifici_id: @referencia_caldendari.edifici_id, operacio_id: @referencia_caldendari.operacio_id }
    end

    assert_redirected_to referencia_caldendari_path(assigns(:referencia_caldendari))
  end

  test "should show referencia_caldendari" do
    get :show, id: @referencia_caldendari
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referencia_caldendari
    assert_response :success
  end

  test "should update referencia_caldendari" do
    patch :update, id: @referencia_caldendari, referencia_caldendari: { any: @referencia_caldendari.any, edifici_id: @referencia_caldendari.edifici_id, operacio_id: @referencia_caldendari.operacio_id }
    assert_redirected_to referencia_caldendari_path(assigns(:referencia_caldendari))
  end

  test "should destroy referencia_caldendari" do
    assert_difference('ReferenciaCaldendari.count', -1) do
      delete :destroy, id: @referencia_caldendari
    end

    assert_redirected_to referencia_caldendaris_path
  end
end
