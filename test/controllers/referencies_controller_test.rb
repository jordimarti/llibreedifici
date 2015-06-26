require 'test_helper'

class ReferenciesControllerTest < ActionController::TestCase
  setup do
    @referencia = referencies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:referencies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create referencia" do
    assert_difference('Referencia.count') do
      post :create, referencia: { edifici_id: @referencia.edifici_id, operacio_id: @referencia.operacio_id }
    end

    assert_redirected_to referencia_path(assigns(:referencia))
  end

  test "should show referencia" do
    get :show, id: @referencia
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @referencia
    assert_response :success
  end

  test "should update referencia" do
    patch :update, id: @referencia, referencia: { edifici_id: @referencia.edifici_id, operacio_id: @referencia.operacio_id }
    assert_redirected_to referencia_path(assigns(:referencia))
  end

  test "should destroy referencia" do
    assert_difference('Referencia.count', -1) do
      delete :destroy, id: @referencia
    end

    assert_redirected_to referencies_path
  end
end
