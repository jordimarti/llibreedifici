require 'test_helper'

class EntitatControlsControllerTest < ActionController::TestCase
  setup do
    @entitat_control = entitat_controls(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:entitat_controls)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create entitat_control" do
    assert_difference('EntitatControl.count') do
      post :create, entitat_control: { adreca_entitat_control: @entitat_control.adreca_entitat_control, cp_entitat_control: @entitat_control.cp_entitat_control, edifici_id: @entitat_control.edifici_id, nif_entitat_control: @entitat_control.nif_entitat_control, nom_entitat_control: @entitat_control.nom_entitat_control, pais_entitat_control: @entitat_control.pais_entitat_control, poblacio_entitat_control: @entitat_control.poblacio_entitat_control, provincia_entitat_control: @entitat_control.provincia_entitat_control }
    end

    assert_redirected_to entitat_control_path(assigns(:entitat_control))
  end

  test "should show entitat_control" do
    get :show, id: @entitat_control
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @entitat_control
    assert_response :success
  end

  test "should update entitat_control" do
    patch :update, id: @entitat_control, entitat_control: { adreca_entitat_control: @entitat_control.adreca_entitat_control, cp_entitat_control: @entitat_control.cp_entitat_control, edifici_id: @entitat_control.edifici_id, nif_entitat_control: @entitat_control.nif_entitat_control, nom_entitat_control: @entitat_control.nom_entitat_control, pais_entitat_control: @entitat_control.pais_entitat_control, poblacio_entitat_control: @entitat_control.poblacio_entitat_control, provincia_entitat_control: @entitat_control.provincia_entitat_control }
    assert_redirected_to entitat_control_path(assigns(:entitat_control))
  end

  test "should destroy entitat_control" do
    assert_difference('EntitatControl.count', -1) do
      delete :destroy, id: @entitat_control
    end

    assert_redirected_to entitat_controls_path
  end
end
