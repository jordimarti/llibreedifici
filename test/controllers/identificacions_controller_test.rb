require 'test_helper'

class IdentificacionsControllerTest < ActionController::TestCase
  setup do
    @identificacio = identificacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:identificacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create identificacio" do
    assert_difference('Identificacio.count') do
      post :create, identificacio: { any_fi_construccio: @identificacio.any_fi_construccio, any_inici_construccio: @identificacio.any_inici_construccio, bloc_edifici: @identificacio.bloc_edifici, cp_edifici: @identificacio.cp_edifici, edifici_id: @identificacio.edifici_id, escala_edifici: @identificacio.escala_edifici, numero_edifici: @identificacio.numero_edifici, poblacio_edifici: @identificacio.poblacio_edifici, provincia_edifici: @identificacio.provincia_edifici, ref_cadastral: @identificacio.ref_cadastral, tipus_via_edifici: @identificacio.tipus_via_edifici, us_edifici: @identificacio.us_edifici, via_edifici: @identificacio.via_edifici }
    end

    assert_redirected_to identificacio_path(assigns(:identificacio))
  end

  test "should show identificacio" do
    get :show, id: @identificacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @identificacio
    assert_response :success
  end

  test "should update identificacio" do
    patch :update, id: @identificacio, identificacio: { any_fi_construccio: @identificacio.any_fi_construccio, any_inici_construccio: @identificacio.any_inici_construccio, bloc_edifici: @identificacio.bloc_edifici, cp_edifici: @identificacio.cp_edifici, edifici_id: @identificacio.edifici_id, escala_edifici: @identificacio.escala_edifici, numero_edifici: @identificacio.numero_edifici, poblacio_edifici: @identificacio.poblacio_edifici, provincia_edifici: @identificacio.provincia_edifici, ref_cadastral: @identificacio.ref_cadastral, tipus_via_edifici: @identificacio.tipus_via_edifici, us_edifici: @identificacio.us_edifici, via_edifici: @identificacio.via_edifici }
    assert_redirected_to identificacio_path(assigns(:identificacio))
  end

  test "should destroy identificacio" do
    assert_difference('Identificacio.count', -1) do
      delete :destroy, id: @identificacio
    end

    assert_redirected_to identificacions_path
  end
end
