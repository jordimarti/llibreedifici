require 'test_helper'

class DadesEdificiNousControllerTest < ActionController::TestCase
  setup do
    @dades_edifici_nou = dades_edifici_nous(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:dades_edifici_nous)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create dades_edifici_nou" do
    assert_difference('DadesEdificiNou.count') do
      post :create, dades_edifici_nou: { any_fi_construccio: @dades_edifici_nou.any_fi_construccio, any_inici_construccio: @dades_edifici_nou.any_inici_construccio, bloc_edifici: @dades_edifici_nou.bloc_edifici, cp_edifici: @dades_edifici_nou.cp_edifici, edifici_id: @dades_edifici_nou.edifici_id, escala_edifici: @dades_edifici_nou.escala_edifici, numero_edifici: @dades_edifici_nou.numero_edifici, poblacio_edifici: @dades_edifici_nou.poblacio_edifici, provincia_edifici: @dades_edifici_nou.provincia_edifici, ref_cadastral: @dades_edifici_nou.ref_cadastral, tipus_via_edifici: @dades_edifici_nou.tipus_via_edifici, us_edifici: @dades_edifici_nou.us_edifici, via_edifici: @dades_edifici_nou.via_edifici }
    end

    assert_redirected_to dades_edifici_nou_path(assigns(:dades_edifici_nou))
  end

  test "should show dades_edifici_nou" do
    get :show, id: @dades_edifici_nou
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @dades_edifici_nou
    assert_response :success
  end

  test "should update dades_edifici_nou" do
    patch :update, id: @dades_edifici_nou, dades_edifici_nou: { any_fi_construccio: @dades_edifici_nou.any_fi_construccio, any_inici_construccio: @dades_edifici_nou.any_inici_construccio, bloc_edifici: @dades_edifici_nou.bloc_edifici, cp_edifici: @dades_edifici_nou.cp_edifici, edifici_id: @dades_edifici_nou.edifici_id, escala_edifici: @dades_edifici_nou.escala_edifici, numero_edifici: @dades_edifici_nou.numero_edifici, poblacio_edifici: @dades_edifici_nou.poblacio_edifici, provincia_edifici: @dades_edifici_nou.provincia_edifici, ref_cadastral: @dades_edifici_nou.ref_cadastral, tipus_via_edifici: @dades_edifici_nou.tipus_via_edifici, us_edifici: @dades_edifici_nou.us_edifici, via_edifici: @dades_edifici_nou.via_edifici }
    assert_redirected_to dades_edifici_nou_path(assigns(:dades_edifici_nou))
  end

  test "should destroy dades_edifici_nou" do
    assert_difference('DadesEdificiNou.count', -1) do
      delete :destroy, id: @dades_edifici_nou
    end

    assert_redirected_to dades_edifici_nous_path
  end
end
