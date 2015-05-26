require 'test_helper'

class ControlEntitatsControllerTest < ActionController::TestCase
  setup do
    @control_entitat = control_entitats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:control_entitats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create control_entitat" do
    assert_difference('ControlEntitat.count') do
      post :create, control_entitat: { bloc_entitat_control: @control_entitat.bloc_entitat_control, cp_entitat_control: @control_entitat.cp_entitat_control, edifici_id: @control_entitat.edifici_id, escala_entitat_control: @control_entitat.escala_entitat_control, nif_entitat_control: @control_entitat.nif_entitat_control, nom_entitat_control: @control_entitat.nom_entitat_control, numero_entitat_control: @control_entitat.numero_entitat_control, pais_entitat_control: @control_entitat.pais_entitat_control, pis_entitat_control: @control_entitat.pis_entitat_control, poblacio_entitat_control: @control_entitat.poblacio_entitat_control, provincia_entitat_control: @control_entitat.provincia_entitat_control, tipus_via_entitat_control: @control_entitat.tipus_via_entitat_control, via_entitat_control: @control_entitat.via_entitat_control }
    end

    assert_redirected_to control_entitat_path(assigns(:control_entitat))
  end

  test "should show control_entitat" do
    get :show, id: @control_entitat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @control_entitat
    assert_response :success
  end

  test "should update control_entitat" do
    patch :update, id: @control_entitat, control_entitat: { bloc_entitat_control: @control_entitat.bloc_entitat_control, cp_entitat_control: @control_entitat.cp_entitat_control, edifici_id: @control_entitat.edifici_id, escala_entitat_control: @control_entitat.escala_entitat_control, nif_entitat_control: @control_entitat.nif_entitat_control, nom_entitat_control: @control_entitat.nom_entitat_control, numero_entitat_control: @control_entitat.numero_entitat_control, pais_entitat_control: @control_entitat.pais_entitat_control, pis_entitat_control: @control_entitat.pis_entitat_control, poblacio_entitat_control: @control_entitat.poblacio_entitat_control, provincia_entitat_control: @control_entitat.provincia_entitat_control, tipus_via_entitat_control: @control_entitat.tipus_via_entitat_control, via_entitat_control: @control_entitat.via_entitat_control }
    assert_redirected_to control_entitat_path(assigns(:control_entitat))
  end

  test "should destroy control_entitat" do
    assert_difference('ControlEntitat.count', -1) do
      delete :destroy, id: @control_entitat
    end

    assert_redirected_to control_entitats_path
  end
end
