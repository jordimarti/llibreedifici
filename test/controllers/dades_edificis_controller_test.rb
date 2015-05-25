require 'test_helper'

class DadesEdificisControllerTest < ActionController::TestCase
  setup do
    @dades_edifici = dades_edificis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dades_edificis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dades_edifici" do
    assert_difference('DadesEdifici.count') do
      post :create, dades_edifici: { any_fi_construccio: @dades_edifici.any_fi_construccio, any_inici_construccio: @dades_edifici.any_inici_construccio, bloc_edifici: @dades_edifici.bloc_edifici, cp_edifici: @dades_edifici.cp_edifici, edifici_id: @dades_edifici.edifici_id, escala_edifici: @dades_edifici.escala_edifici, numero_edifici: @dades_edifici.numero_edifici, poblacio_edifici: @dades_edifici.poblacio_edifici, provincia_edifici: @dades_edifici.provincia_edifici, ref_cadastral: @dades_edifici.ref_cadastral, tipus_via_edifici: @dades_edifici.tipus_via_edifici, us_edifici: @dades_edifici.us_edifici, via_edifici: @dades_edifici.via_edifici }
    end

    assert_redirected_to dades_edifici_path(assigns(:dades_edifici))
  end

  test "should show dades_edifici" do
    get :show, id: @dades_edifici
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dades_edifici
    assert_response :success
  end

  test "should update dades_edifici" do
    patch :update, id: @dades_edifici, dades_edifici: { any_fi_construccio: @dades_edifici.any_fi_construccio, any_inici_construccio: @dades_edifici.any_inici_construccio, bloc_edifici: @dades_edifici.bloc_edifici, cp_edifici: @dades_edifici.cp_edifici, edifici_id: @dades_edifici.edifici_id, escala_edifici: @dades_edifici.escala_edifici, numero_edifici: @dades_edifici.numero_edifici, poblacio_edifici: @dades_edifici.poblacio_edifici, provincia_edifici: @dades_edifici.provincia_edifici, ref_cadastral: @dades_edifici.ref_cadastral, tipus_via_edifici: @dades_edifici.tipus_via_edifici, us_edifici: @dades_edifici.us_edifici, via_edifici: @dades_edifici.via_edifici }
    assert_redirected_to dades_edifici_path(assigns(:dades_edifici))
  end

  test "should destroy dades_edifici" do
    assert_difference('DadesEdifici.count', -1) do
      delete :destroy, id: @dades_edifici
    end

    assert_redirected_to dades_edificis_path
  end
end
