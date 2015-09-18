require 'test_helper'

class CoordinadorsControllerTest < ActionController::TestCase
  setup do
    @coordinador = coordinadors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:coordinadors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create coordinador" do
    assert_difference('Coordinador.count') do
      post :create, coordinador: { edifici_id: @coordinador.edifici_id, email: @coordinador.email, nif_coordinador: @coordinador.nif_coordinador, nom_coordinador: @coordinador.nom_coordinador, rao_social_coordinador: @coordinador.rao_social_coordinador, telefon: @coordinador.telefon, titulacio_coordinador: @coordinador.titulacio_coordinador, web: @coordinador.web }
    end

    assert_redirected_to coordinador_path(assigns(:coordinador))
  end

  test "should show coordinador" do
    get :show, id: @coordinador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @coordinador
    assert_response :success
  end

  test "should update coordinador" do
    patch :update, id: @coordinador, coordinador: { edifici_id: @coordinador.edifici_id, email: @coordinador.email, nif_coordinador: @coordinador.nif_coordinador, nom_coordinador: @coordinador.nom_coordinador, rao_social_coordinador: @coordinador.rao_social_coordinador, telefon: @coordinador.telefon, titulacio_coordinador: @coordinador.titulacio_coordinador, web: @coordinador.web }
    assert_redirected_to coordinador_path(assigns(:coordinador))
  end

  test "should destroy coordinador" do
    assert_difference('Coordinador.count', -1) do
      delete :destroy, id: @coordinador
    end

    assert_redirected_to coordinadors_path
  end
end
