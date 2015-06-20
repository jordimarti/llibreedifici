require 'test_helper'

class SistemesControllerTest < ActionController::TestCase
  setup do
    @sistema = sistemes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:sistemes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create sistema" do
    assert_difference('Sistema.count') do
      post :create, sistema: { edifici_id: @sistema.edifici_id, nom_sistema: @sistema.nom_sistema, pare_sistema: @sistema.pare_sistema }
    end

    assert_redirected_to sistema_path(assigns(:sistema))
  end

  test "should show sistema" do
    get :show, id: @sistema
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @sistema
    assert_response :success
  end

  test "should update sistema" do
    patch :update, id: @sistema, sistema: { edifici_id: @sistema.edifici_id, nom_sistema: @sistema.nom_sistema, pare_sistema: @sistema.pare_sistema }
    assert_redirected_to sistema_path(assigns(:sistema))
  end

  test "should destroy sistema" do
    assert_difference('Sistema.count', -1) do
      delete :destroy, id: @sistema
    end

    assert_redirected_to sistemes_path
  end
end
