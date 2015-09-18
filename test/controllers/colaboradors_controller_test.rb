require 'test_helper'

class ColaboradorsControllerTest < ActionController::TestCase
  setup do
    @colaborador = colaboradors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:colaboradors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create colaborador" do
    assert_difference('Colaborador.count') do
      post :create, colaborador: { ambit_colaboracio: @colaborador.ambit_colaboracio, edifici_id: @colaborador.edifici_id, email: @colaborador.email, nif_colaborador: @colaborador.nif_colaborador, nom_colaborador: @colaborador.nom_colaborador, rao_social_colaborador: @colaborador.rao_social_colaborador, telefon: @colaborador.telefon, titulacio_colaborador: @colaborador.titulacio_colaborador, web: @colaborador.web }
    end

    assert_redirected_to colaborador_path(assigns(:colaborador))
  end

  test "should show colaborador" do
    get :show, id: @colaborador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @colaborador
    assert_response :success
  end

  test "should update colaborador" do
    patch :update, id: @colaborador, colaborador: { ambit_colaboracio: @colaborador.ambit_colaboracio, edifici_id: @colaborador.edifici_id, email: @colaborador.email, nif_colaborador: @colaborador.nif_colaborador, nom_colaborador: @colaborador.nom_colaborador, rao_social_colaborador: @colaborador.rao_social_colaborador, telefon: @colaborador.telefon, titulacio_colaborador: @colaborador.titulacio_colaborador, web: @colaborador.web }
    assert_redirected_to colaborador_path(assigns(:colaborador))
  end

  test "should destroy colaborador" do
    assert_difference('Colaborador.count', -1) do
      delete :destroy, id: @colaborador
    end

    assert_redirected_to colaboradors_path
  end
end
