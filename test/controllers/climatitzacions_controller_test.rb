require 'test_helper'

class ClimatitzacionsControllerTest < ActionController::TestCase
  setup do
    @climatitzacio = climatitzacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:climatitzacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create climatitzacio" do
    assert_difference('Climatitzacio.count') do
      post :create, climatitzacio: { altres_pn_major_70: @climatitzacio.altres_pn_major_70, altres_pn_menor_70: @climatitzacio.altres_pn_menor_70, caldera_biomassa: @climatitzacio.caldera_biomassa, caldera_solar_termica: @climatitzacio.caldera_solar_termica, clima_pn_12_70_autonoms: @climatitzacio.clima_pn_12_70_autonoms, clima_pn_12_70_recuperador: @climatitzacio.clima_pn_12_70_recuperador, clima_pn_12_70_torres: @climatitzacio.clima_pn_12_70_torres, clima_pn_major_70_autonoms: @climatitzacio.clima_pn_major_70_autonoms, clima_pn_major_70_recuperador: @climatitzacio.clima_pn_major_70_recuperador, clima_pn_major_70_torres: @climatitzacio.clima_pn_major_70_torres, clima_pn_menor_12_autonoms: @climatitzacio.clima_pn_menor_12_autonoms, clima_pn_menor_12_recuperador: @climatitzacio.clima_pn_menor_12_recuperador, clima_pn_menor_12_torres: @climatitzacio.clima_pn_menor_12_torres, edifici_id: @climatitzacio.edifici_id, escalfador_pn_24_70: @climatitzacio.escalfador_pn_24_70, escalfador_pn_major_70: @climatitzacio.escalfador_pn_major_70, escalfador_pn_menor_24: @climatitzacio.escalfador_pn_menor_24 }
    end

    assert_redirected_to climatitzacio_path(assigns(:climatitzacio))
  end

  test "should show climatitzacio" do
    get :show, id: @climatitzacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @climatitzacio
    assert_response :success
  end

  test "should update climatitzacio" do
    patch :update, id: @climatitzacio, climatitzacio: { altres_pn_major_70: @climatitzacio.altres_pn_major_70, altres_pn_menor_70: @climatitzacio.altres_pn_menor_70, caldera_biomassa: @climatitzacio.caldera_biomassa, caldera_solar_termica: @climatitzacio.caldera_solar_termica, clima_pn_12_70_autonoms: @climatitzacio.clima_pn_12_70_autonoms, clima_pn_12_70_recuperador: @climatitzacio.clima_pn_12_70_recuperador, clima_pn_12_70_torres: @climatitzacio.clima_pn_12_70_torres, clima_pn_major_70_autonoms: @climatitzacio.clima_pn_major_70_autonoms, clima_pn_major_70_recuperador: @climatitzacio.clima_pn_major_70_recuperador, clima_pn_major_70_torres: @climatitzacio.clima_pn_major_70_torres, clima_pn_menor_12_autonoms: @climatitzacio.clima_pn_menor_12_autonoms, clima_pn_menor_12_recuperador: @climatitzacio.clima_pn_menor_12_recuperador, clima_pn_menor_12_torres: @climatitzacio.clima_pn_menor_12_torres, edifici_id: @climatitzacio.edifici_id, escalfador_pn_24_70: @climatitzacio.escalfador_pn_24_70, escalfador_pn_major_70: @climatitzacio.escalfador_pn_major_70, escalfador_pn_menor_24: @climatitzacio.escalfador_pn_menor_24 }
    assert_redirected_to climatitzacio_path(assigns(:climatitzacio))
  end

  test "should destroy climatitzacio" do
    assert_difference('Climatitzacio.count', -1) do
      delete :destroy, id: @climatitzacio
    end

    assert_redirected_to climatitzacions_path
  end
end
