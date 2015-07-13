require 'test_helper'

class VentilacionsControllerTest < ActionController::TestCase
  setup do
    @ventilacio = ventilacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ventilacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ventilacio" do
    assert_difference('Ventilacio.count') do
      post :create, ventilacio: { edifici_id: @ventilacio.edifici_id, garatge_mecanica_conductes: @ventilacio.garatge_mecanica_conductes, garatge_mecanica_control: @ventilacio.garatge_mecanica_control, garatge_mecanica_obertures: @ventilacio.garatge_mecanica_obertures, garatge_natural_conductes: @ventilacio.garatge_natural_conductes, garatge_natural_obertures: @ventilacio.garatge_natural_obertures, habitatge_mecanica_conductes: @ventilacio.habitatge_mecanica_conductes, habitatge_mecanica_control: @ventilacio.habitatge_mecanica_control, habitatge_mecanica_obertures: @ventilacio.habitatge_mecanica_obertures, habitatge_natural_conductes: @ventilacio.habitatge_natural_conductes, habitatge_natural_obertures: @ventilacio.habitatge_natural_obertures, magatzem_mecanica_conductes: @ventilacio.magatzem_mecanica_conductes, magatzem_mecanica_control: @ventilacio.magatzem_mecanica_control, magatzem_mecanica_obertures: @ventilacio.magatzem_mecanica_obertures, magatzem_natural_conductes: @ventilacio.magatzem_natural_conductes, magatzem_natural_obertures: @ventilacio.magatzem_natural_obertures, traster_mecanica_conductes: @ventilacio.traster_mecanica_conductes, traster_mecanica_control: @ventilacio.traster_mecanica_control, traster_mecanica_obertures: @ventilacio.traster_mecanica_obertures, traster_natural_conductes: @ventilacio.traster_natural_conductes, traster_natural_obertures: @ventilacio.traster_natural_obertures }
    end

    assert_redirected_to ventilacio_path(assigns(:ventilacio))
  end

  test "should show ventilacio" do
    get :show, id: @ventilacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ventilacio
    assert_response :success
  end

  test "should update ventilacio" do
    patch :update, id: @ventilacio, ventilacio: { edifici_id: @ventilacio.edifici_id, garatge_mecanica_conductes: @ventilacio.garatge_mecanica_conductes, garatge_mecanica_control: @ventilacio.garatge_mecanica_control, garatge_mecanica_obertures: @ventilacio.garatge_mecanica_obertures, garatge_natural_conductes: @ventilacio.garatge_natural_conductes, garatge_natural_obertures: @ventilacio.garatge_natural_obertures, habitatge_mecanica_conductes: @ventilacio.habitatge_mecanica_conductes, habitatge_mecanica_control: @ventilacio.habitatge_mecanica_control, habitatge_mecanica_obertures: @ventilacio.habitatge_mecanica_obertures, habitatge_natural_conductes: @ventilacio.habitatge_natural_conductes, habitatge_natural_obertures: @ventilacio.habitatge_natural_obertures, magatzem_mecanica_conductes: @ventilacio.magatzem_mecanica_conductes, magatzem_mecanica_control: @ventilacio.magatzem_mecanica_control, magatzem_mecanica_obertures: @ventilacio.magatzem_mecanica_obertures, magatzem_natural_conductes: @ventilacio.magatzem_natural_conductes, magatzem_natural_obertures: @ventilacio.magatzem_natural_obertures, traster_mecanica_conductes: @ventilacio.traster_mecanica_conductes, traster_mecanica_control: @ventilacio.traster_mecanica_control, traster_mecanica_obertures: @ventilacio.traster_mecanica_obertures, traster_natural_conductes: @ventilacio.traster_natural_conductes, traster_natural_obertures: @ventilacio.traster_natural_obertures }
    assert_redirected_to ventilacio_path(assigns(:ventilacio))
  end

  test "should destroy ventilacio" do
    assert_difference('Ventilacio.count', -1) do
      delete :destroy, id: @ventilacio
    end

    assert_redirected_to ventilacions_path
  end
end
