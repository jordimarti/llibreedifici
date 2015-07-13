require 'test_helper'

class IncendisControllerTest < ActionController::TestCase
  setup do
    @incendi = incendis(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:incendis)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create incendi" do
    assert_difference('Incendi.count') do
      post :create, incendi: { abastiment_aigua: @incendi.abastiment_aigua, alarma_automatica: @incendi.alarma_automatica, alarma_manual: @incendi.alarma_manual, bie: @incendi.bie, columnes_seques: @incendi.columnes_seques, edifici_id: @incendi.edifici_id, extintors: @incendi.extintors, hidrants: @incendi.hidrants, parallamps: @incendi.parallamps, ruixadors: @incendi.ruixadors }
    end

    assert_redirected_to incendi_path(assigns(:incendi))
  end

  test "should show incendi" do
    get :show, id: @incendi
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @incendi
    assert_response :success
  end

  test "should update incendi" do
    patch :update, id: @incendi, incendi: { abastiment_aigua: @incendi.abastiment_aigua, alarma_automatica: @incendi.alarma_automatica, alarma_manual: @incendi.alarma_manual, bie: @incendi.bie, columnes_seques: @incendi.columnes_seques, edifici_id: @incendi.edifici_id, extintors: @incendi.extintors, hidrants: @incendi.hidrants, parallamps: @incendi.parallamps, ruixadors: @incendi.ruixadors }
    assert_redirected_to incendi_path(assigns(:incendi))
  end

  test "should destroy incendi" do
    assert_difference('Incendi.count', -1) do
      delete :destroy, id: @incendi
    end

    assert_redirected_to incendis_path
  end
end
