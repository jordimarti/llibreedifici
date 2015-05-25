require 'test_helper'

class IndustrialsControllerTest < ActionController::TestCase
  setup do
    @industrial = industrials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:industrials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create industrial" do
    assert_difference('Industrial.count') do
      post :create, industrial: { bloc_industrial: @industrial.bloc_industrial, cp_industrial: @industrial.cp_industrial, edifici_id: @industrial.edifici_id, escala_industrial: @industrial.escala_industrial, nif_industrial: @industrial.nif_industrial, nom_industrial: @industrial.nom_industrial, numero_industrial: @industrial.numero_industrial, pais_industrial: @industrial.pais_industrial, pis_industrial: @industrial.pis_industrial, poblacio_industrial: @industrial.poblacio_industrial, provincia_industrial: @industrial.provincia_industrial, tipus_via_industrial: @industrial.tipus_via_industrial, via_industrial: @industrial.via_industrial }
    end

    assert_redirected_to industrial_path(assigns(:industrial))
  end

  test "should show industrial" do
    get :show, id: @industrial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @industrial
    assert_response :success
  end

  test "should update industrial" do
    patch :update, id: @industrial, industrial: { bloc_industrial: @industrial.bloc_industrial, cp_industrial: @industrial.cp_industrial, edifici_id: @industrial.edifici_id, escala_industrial: @industrial.escala_industrial, nif_industrial: @industrial.nif_industrial, nom_industrial: @industrial.nom_industrial, numero_industrial: @industrial.numero_industrial, pais_industrial: @industrial.pais_industrial, pis_industrial: @industrial.pis_industrial, poblacio_industrial: @industrial.poblacio_industrial, provincia_industrial: @industrial.provincia_industrial, tipus_via_industrial: @industrial.tipus_via_industrial, via_industrial: @industrial.via_industrial }
    assert_redirected_to industrial_path(assigns(:industrial))
  end

  test "should destroy industrial" do
    assert_difference('Industrial.count', -1) do
      delete :destroy, id: @industrial
    end

    assert_redirected_to industrials_path
  end
end
