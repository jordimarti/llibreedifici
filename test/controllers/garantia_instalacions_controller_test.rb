require 'test_helper'

class GarantiaInstalacionsControllerTest < ActionController::TestCase
  setup do
    @garantia_instalacio = garantia_instalacions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garantia_instalacions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garantia_instalacio" do
    assert_difference('GarantiaInstalacio.count') do
      post :create, garantia_instalacio: { edifici_id: @garantia_instalacio.edifici_id, empresa: @garantia_instalacio.empresa, instalacio: @garantia_instalacio.instalacio, tipus: @garantia_instalacio.tipus, venciment: @garantia_instalacio.venciment }
    end

    assert_redirected_to garantia_instalacio_path(assigns(:garantia_instalacio))
  end

  test "should show garantia_instalacio" do
    get :show, id: @garantia_instalacio
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garantia_instalacio
    assert_response :success
  end

  test "should update garantia_instalacio" do
    patch :update, id: @garantia_instalacio, garantia_instalacio: { edifici_id: @garantia_instalacio.edifici_id, empresa: @garantia_instalacio.empresa, instalacio: @garantia_instalacio.instalacio, tipus: @garantia_instalacio.tipus, venciment: @garantia_instalacio.venciment }
    assert_redirected_to garantia_instalacio_path(assigns(:garantia_instalacio))
  end

  test "should destroy garantia_instalacio" do
    assert_difference('GarantiaInstalacio.count', -1) do
      delete :destroy, id: @garantia_instalacio
    end

    assert_redirected_to garantia_instalacions_path
  end
end
