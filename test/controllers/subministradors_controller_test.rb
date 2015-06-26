require 'test_helper'

class SubministradorsControllerTest < ActionController::TestCase
  setup do
    @subministrador = subministradors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subministradors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subministrador" do
    assert_difference('Subministrador.count') do
      post :create, subministrador: { adreca_subministrador: @subministrador.adreca_subministrador, cp_subministrador: @subministrador.cp_subministrador, edifici_id: @subministrador.edifici_id, nif_subministrador: @subministrador.nif_subministrador, nom_subministrador: @subministrador.nom_subministrador, pais_subministrador: @subministrador.pais_subministrador, poblacio_subministrador: @subministrador.poblacio_subministrador, provincia_subministrador: @subministrador.provincia_subministrador }
    end

    assert_redirected_to subministrador_path(assigns(:subministrador))
  end

  test "should show subministrador" do
    get :show, id: @subministrador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subministrador
    assert_response :success
  end

  test "should update subministrador" do
    patch :update, id: @subministrador, subministrador: { adreca_subministrador: @subministrador.adreca_subministrador, cp_subministrador: @subministrador.cp_subministrador, edifici_id: @subministrador.edifici_id, nif_subministrador: @subministrador.nif_subministrador, nom_subministrador: @subministrador.nom_subministrador, pais_subministrador: @subministrador.pais_subministrador, poblacio_subministrador: @subministrador.poblacio_subministrador, provincia_subministrador: @subministrador.provincia_subministrador }
    assert_redirected_to subministrador_path(assigns(:subministrador))
  end

  test "should destroy subministrador" do
    assert_difference('Subministrador.count', -1) do
      delete :destroy, id: @subministrador
    end

    assert_redirected_to subministradors_path
  end
end
