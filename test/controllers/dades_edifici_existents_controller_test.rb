require 'test_helper'

class DadesEdificiExistentsControllerTest < ActionController::TestCase
  setup do
    @dades_edifici_existent = dades_edifici_existents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dades_edifici_existents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dades_edifici_existent" do
    assert_difference('DadesEdificiExistent.count') do
      post :create, dades_edifici_existent: { bloc_edifici: @dades_edifici_existent.bloc_edifici, cp_edifici: @dades_edifici_existent.cp_edifici, edifici_id: @dades_edifici_existent.edifici_id, escala_edifici: @dades_edifici_existent.escala_edifici, numero_edifici: @dades_edifici_existent.numero_edifici, poblacio_edifici: @dades_edifici_existent.poblacio_edifici, provincia_edifici: @dades_edifici_existent.provincia_edifici, ref_cadastral: @dades_edifici_existent.ref_cadastral, tipus_via_edifici: @dades_edifici_existent.tipus_via_edifici, us_edifici: @dades_edifici_existent.us_edifici, via_edifici: @dades_edifici_existent.via_edifici }
    end

    assert_redirected_to dades_edifici_existent_path(assigns(:dades_edifici_existent))
  end

  test "should show dades_edifici_existent" do
    get :show, id: @dades_edifici_existent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dades_edifici_existent
    assert_response :success
  end

  test "should update dades_edifici_existent" do
    patch :update, id: @dades_edifici_existent, dades_edifici_existent: { bloc_edifici: @dades_edifici_existent.bloc_edifici, cp_edifici: @dades_edifici_existent.cp_edifici, edifici_id: @dades_edifici_existent.edifici_id, escala_edifici: @dades_edifici_existent.escala_edifici, numero_edifici: @dades_edifici_existent.numero_edifici, poblacio_edifici: @dades_edifici_existent.poblacio_edifici, provincia_edifici: @dades_edifici_existent.provincia_edifici, ref_cadastral: @dades_edifici_existent.ref_cadastral, tipus_via_edifici: @dades_edifici_existent.tipus_via_edifici, us_edifici: @dades_edifici_existent.us_edifici, via_edifici: @dades_edifici_existent.via_edifici }
    assert_redirected_to dades_edifici_existent_path(assigns(:dades_edifici_existent))
  end

  test "should destroy dades_edifici_existent" do
    assert_difference('DadesEdificiExistent.count', -1) do
      delete :destroy, id: @dades_edifici_existent
    end

    assert_redirected_to dades_edifici_existents_path
  end
end
