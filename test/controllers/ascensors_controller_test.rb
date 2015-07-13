require 'test_helper'

class AscensorsControllerTest < ActionController::TestCase
  setup do
    @ascensor = ascensors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ascensors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ascensor" do
    assert_difference('Ascensor.count') do
      post :create, ascensor: { altres: @ascensor.altres, edifici_comunitari: @ascensor.edifici_comunitari, edifici_id: @ascensor.edifici_id, habitatge_unifamiliar: @ascensor.habitatge_unifamiliar, mes_20_plantes: @ascensor.mes_20_plantes }
    end

    assert_redirected_to ascensor_path(assigns(:ascensor))
  end

  test "should show ascensor" do
    get :show, id: @ascensor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ascensor
    assert_response :success
  end

  test "should update ascensor" do
    patch :update, id: @ascensor, ascensor: { altres: @ascensor.altres, edifici_comunitari: @ascensor.edifici_comunitari, edifici_id: @ascensor.edifici_id, habitatge_unifamiliar: @ascensor.habitatge_unifamiliar, mes_20_plantes: @ascensor.mes_20_plantes }
    assert_redirected_to ascensor_path(assigns(:ascensor))
  end

  test "should destroy ascensor" do
    assert_difference('Ascensor.count', -1) do
      delete :destroy, id: @ascensor
    end

    assert_redirected_to ascensors_path
  end
end
