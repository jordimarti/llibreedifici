require 'test_helper'

class PromotorsControllerTest < ActionController::TestCase
  setup do
    @promotor = promotors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:promotors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create promotor" do
    assert_difference('Promotor.count') do
      post :create, promotor: { bloc_promotor: @promotor.bloc_promotor, cp_promotor: @promotor.cp_promotor, edifici_id: @promotor.edifici_id, escala_promotor: @promotor.escala_promotor, nif_promotor: @promotor.nif_promotor, nom_promotor: @promotor.nom_promotor, numero_promotor: @promotor.numero_promotor, pais_promotor: @promotor.pais_promotor, pis_promotor: @promotor.pis_promotor, poblacio_promotor: @promotor.poblacio_promotor, provincia_promotor: @promotor.provincia_promotor, tipus_via_promotor: @promotor.tipus_via_promotor, via_promotor: @promotor.via_promotor }
    end

    assert_redirected_to promotor_path(assigns(:promotor))
  end

  test "should show promotor" do
    get :show, id: @promotor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @promotor
    assert_response :success
  end

  test "should update promotor" do
    patch :update, id: @promotor, promotor: { bloc_promotor: @promotor.bloc_promotor, cp_promotor: @promotor.cp_promotor, edifici_id: @promotor.edifici_id, escala_promotor: @promotor.escala_promotor, nif_promotor: @promotor.nif_promotor, nom_promotor: @promotor.nom_promotor, numero_promotor: @promotor.numero_promotor, pais_promotor: @promotor.pais_promotor, pis_promotor: @promotor.pis_promotor, poblacio_promotor: @promotor.poblacio_promotor, provincia_promotor: @promotor.provincia_promotor, tipus_via_promotor: @promotor.tipus_via_promotor, via_promotor: @promotor.via_promotor }
    assert_redirected_to promotor_path(assigns(:promotor))
  end

  test "should destroy promotor" do
    assert_difference('Promotor.count', -1) do
      delete :destroy, id: @promotor
    end

    assert_redirected_to promotors_path
  end
end
