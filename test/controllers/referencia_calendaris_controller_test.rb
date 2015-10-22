require 'test_helper'

class ReferenciaCalendarisControllerTest < ActionController::TestCase
  setup do
    @referencia_calendari = referencia_calendaris(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referencia_calendaris)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referencia_calendari" do
    assert_difference('ReferenciaCalendari.count') do
      post :create, referencia_calendari: { any: @referencia_calendari.any, edifici_id: @referencia_calendari.edifici_id, operacio_id: @referencia_calendari.operacio_id }
    end

    assert_redirected_to referencia_calendari_path(assigns(:referencia_calendari))
  end

  test "should show referencia_calendari" do
    get :show, id: @referencia_calendari
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referencia_calendari
    assert_response :success
  end

  test "should update referencia_calendari" do
    patch :update, id: @referencia_calendari, referencia_calendari: { any: @referencia_calendari.any, edifici_id: @referencia_calendari.edifici_id, operacio_id: @referencia_calendari.operacio_id }
    assert_redirected_to referencia_calendari_path(assigns(:referencia_calendari))
  end

  test "should destroy referencia_calendari" do
    assert_difference('ReferenciaCalendari.count', -1) do
      delete :destroy, id: @referencia_calendari
    end

    assert_redirected_to referencia_calendaris_path
  end
end
