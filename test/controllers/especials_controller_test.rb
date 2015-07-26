require 'test_helper'

class EspecialsControllerTest < ActionController::TestCase
  setup do
    @especial = especials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:especials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create especial" do
    assert_difference('Especial.count') do
      post :create, especial: { edifici_id: @especial.edifici_id, piscina_ceramica: @especial.piscina_ceramica, piscina_climatitzacio: @especial.piscina_climatitzacio, piscina_estructura_acer: @especial.piscina_estructura_acer, piscina_estructura_composite: @especial.piscina_estructura_composite, piscina_estructura_obra: @especial.piscina_estructura_obra, piscina_iluminacio: @especial.piscina_iluminacio, piscina_porcellana: @especial.piscina_porcellana, piscina_purificador: @especial.piscina_purificador, piscina_vores_formigo: @especial.piscina_vores_formigo, piscina_vores_pedra: @especial.piscina_vores_pedra }
    end

    assert_redirected_to especial_path(assigns(:especial))
  end

  test "should show especial" do
    get :show, id: @especial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @especial
    assert_response :success
  end

  test "should update especial" do
    patch :update, id: @especial, especial: { edifici_id: @especial.edifici_id, piscina_ceramica: @especial.piscina_ceramica, piscina_climatitzacio: @especial.piscina_climatitzacio, piscina_estructura_acer: @especial.piscina_estructura_acer, piscina_estructura_composite: @especial.piscina_estructura_composite, piscina_estructura_obra: @especial.piscina_estructura_obra, piscina_iluminacio: @especial.piscina_iluminacio, piscina_porcellana: @especial.piscina_porcellana, piscina_purificador: @especial.piscina_purificador, piscina_vores_formigo: @especial.piscina_vores_formigo, piscina_vores_pedra: @especial.piscina_vores_pedra }
    assert_redirected_to especial_path(assigns(:especial))
  end

  test "should destroy especial" do
    assert_difference('Especial.count', -1) do
      delete :destroy, id: @especial
    end

    assert_redirected_to especials_path
  end
end
