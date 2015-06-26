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
      post :create, industrial: { adreca_industrial: @industrial.adreca_industrial, cp_industrial: @industrial.cp_industrial, edifici_id: @industrial.edifici_id, nif_industrial: @industrial.nif_industrial, nom_industrial: @industrial.nom_industrial, pais_industrial: @industrial.pais_industrial, poblacio_industrial: @industrial.poblacio_industrial, provincia_industrial: @industrial.provincia_industrial }
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
    patch :update, id: @industrial, industrial: { adreca_industrial: @industrial.adreca_industrial, cp_industrial: @industrial.cp_industrial, edifici_id: @industrial.edifici_id, nif_industrial: @industrial.nif_industrial, nom_industrial: @industrial.nom_industrial, pais_industrial: @industrial.pais_industrial, poblacio_industrial: @industrial.poblacio_industrial, provincia_industrial: @industrial.provincia_industrial }
    assert_redirected_to industrial_path(assigns(:industrial))
  end

  test "should destroy industrial" do
    assert_difference('Industrial.count', -1) do
      delete :destroy, id: @industrial
    end

    assert_redirected_to industrials_path
  end
end
