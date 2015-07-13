require 'test_helper'

class ElectricitatsControllerTest < ActionController::TestCase
  setup do
    @electricitat = electricitats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electricitats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create electricitat" do
    assert_difference('Electricitat.count') do
      post :create, electricitat: { centre_transformacio: @electricitat.centre_transformacio, comptador_unic: @electricitat.comptador_unic, comptadors_centralitzats: @electricitat.comptadors_centralitzats, comptadors_individuals_habitatge: @electricitat.comptadors_individuals_habitatge, connexio_terra: @electricitat.connexio_terra, edifici_id: @electricitat.edifici_id, enllumenat_comunitari: @electricitat.enllumenat_comunitari, fotovoltaica: @electricitat.fotovoltaica, mes_100k: @electricitat.mes_100k }
    end

    assert_redirected_to electricitat_path(assigns(:electricitat))
  end

  test "should show electricitat" do
    get :show, id: @electricitat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @electricitat
    assert_response :success
  end

  test "should update electricitat" do
    patch :update, id: @electricitat, electricitat: { centre_transformacio: @electricitat.centre_transformacio, comptador_unic: @electricitat.comptador_unic, comptadors_centralitzats: @electricitat.comptadors_centralitzats, comptadors_individuals_habitatge: @electricitat.comptadors_individuals_habitatge, connexio_terra: @electricitat.connexio_terra, edifici_id: @electricitat.edifici_id, enllumenat_comunitari: @electricitat.enllumenat_comunitari, fotovoltaica: @electricitat.fotovoltaica, mes_100k: @electricitat.mes_100k }
    assert_redirected_to electricitat_path(assigns(:electricitat))
  end

  test "should destroy electricitat" do
    assert_difference('Electricitat.count', -1) do
      delete :destroy, id: @electricitat
    end

    assert_redirected_to electricitats_path
  end
end
