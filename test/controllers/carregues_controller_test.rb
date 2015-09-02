require 'test_helper'

class CarreguesControllerTest < ActionController::TestCase
  setup do
    @carrega = carregues(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:carregues)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create carrega" do
    assert_difference('Carrega.count') do
      post :create, carrega: { document_carrega: @carrega.document_carrega, edifici_id: @carrega.edifici_id, tipus_carrega: @carrega.tipus_carrega }
    end

    assert_redirected_to carrega_path(assigns(:carrega))
  end

  test "should show carrega" do
    get :show, id: @carrega
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @carrega
    assert_response :success
  end

  test "should update carrega" do
    patch :update, id: @carrega, carrega: { document_carrega: @carrega.document_carrega, edifici_id: @carrega.edifici_id, tipus_carrega: @carrega.tipus_carrega }
    assert_redirected_to carrega_path(assigns(:carrega))
  end

  test "should destroy carrega" do
    assert_difference('Carrega.count', -1) do
      delete :destroy, id: @carrega
    end

    assert_redirected_to carregues_path
  end
end
