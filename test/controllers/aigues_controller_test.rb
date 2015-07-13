require 'test_helper'

class AiguesControllerTest < ActionController::TestCase
  setup do
    @aigua = aigues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:aigues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aigua" do
    assert_difference('Aigua.count') do
      post :create, aigua: { captacio_propia: @aigua.captacio_propia, comptador_unic: @aigua.comptador_unic, comptadors_individuals_centralitzats: @aigua.comptadors_individuals_centralitzats, comptadors_individuals_habitatge: @aigua.comptadors_individuals_habitatge, connexio_aforament: @aigua.connexio_aforament, connexio_directa: @aigua.connexio_directa, edifici_id: @aigua.edifici_id, grup_pressio: @aigua.grup_pressio, muntants_coure: @aigua.muntants_coure, muntants_ferro: @aigua.muntants_ferro, muntants_plastic: @aigua.muntants_plastic, muntants_plom: @aigua.muntants_plom }
    end

    assert_redirected_to aigua_path(assigns(:aigua))
  end

  test "should show aigua" do
    get :show, id: @aigua
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aigua
    assert_response :success
  end

  test "should update aigua" do
    patch :update, id: @aigua, aigua: { captacio_propia: @aigua.captacio_propia, comptador_unic: @aigua.comptador_unic, comptadors_individuals_centralitzats: @aigua.comptadors_individuals_centralitzats, comptadors_individuals_habitatge: @aigua.comptadors_individuals_habitatge, connexio_aforament: @aigua.connexio_aforament, connexio_directa: @aigua.connexio_directa, edifici_id: @aigua.edifici_id, grup_pressio: @aigua.grup_pressio, muntants_coure: @aigua.muntants_coure, muntants_ferro: @aigua.muntants_ferro, muntants_plastic: @aigua.muntants_plastic, muntants_plom: @aigua.muntants_plom }
    assert_redirected_to aigua_path(assigns(:aigua))
  end

  test "should destroy aigua" do
    assert_difference('Aigua.count', -1) do
      delete :destroy, id: @aigua
    end

    assert_redirected_to aigues_path
  end
end
