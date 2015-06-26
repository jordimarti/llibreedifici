require 'test_helper'

class OperacionsControllerTest < ActionController::TestCase
  setup do
    @operacio = operacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:operacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create operacio" do
    assert_difference('Operacio.count') do
      post :create, operacio: { creat_usuari: @operacio.creat_usuari, descripcio: @operacio.descripcio, document_referencia: @operacio.document_referencia, obligatorietat: @operacio.obligatorietat, periodicitat: @operacio.periodicitat, responsable: @operacio.responsable }
    end

    assert_redirected_to operacio_path(assigns(:operacio))
  end

  test "should show operacio" do
    get :show, id: @operacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @operacio
    assert_response :success
  end

  test "should update operacio" do
    patch :update, id: @operacio, operacio: { creat_usuari: @operacio.creat_usuari, descripcio: @operacio.descripcio, document_referencia: @operacio.document_referencia, obligatorietat: @operacio.obligatorietat, periodicitat: @operacio.periodicitat, responsable: @operacio.responsable }
    assert_redirected_to operacio_path(assigns(:operacio))
  end

  test "should destroy operacio" do
    assert_difference('Operacio.count', -1) do
      delete :destroy, id: @operacio
    end

    assert_redirected_to operacions_path
  end
end
