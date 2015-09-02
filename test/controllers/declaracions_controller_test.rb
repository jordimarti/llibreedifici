require 'test_helper'

class DeclaracionsControllerTest < ActionController::TestCase
  setup do
    @declaracio = declaracions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:declaracions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create declaracio" do
    assert_difference('Declaracio.count') do
      post :create, declaracio: { data_declaracio: @declaracio.data_declaracio, edifici_id: @declaracio.edifici_id, n_protocol: @declaracio.n_protocol, notari: @declaracio.notari }
    end

    assert_redirected_to declaracio_path(assigns(:declaracio))
  end

  test "should show declaracio" do
    get :show, id: @declaracio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @declaracio
    assert_response :success
  end

  test "should update declaracio" do
    patch :update, id: @declaracio, declaracio: { data_declaracio: @declaracio.data_declaracio, edifici_id: @declaracio.edifici_id, n_protocol: @declaracio.n_protocol, notari: @declaracio.notari }
    assert_redirected_to declaracio_path(assigns(:declaracio))
  end

  test "should destroy declaracio" do
    assert_difference('Declaracio.count', -1) do
      delete :destroy, id: @declaracio
    end

    assert_redirected_to declaracions_path
  end
end
