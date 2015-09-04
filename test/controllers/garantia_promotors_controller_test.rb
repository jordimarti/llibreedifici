require 'test_helper'

class GarantiaPromotorsControllerTest < ActionController::TestCase
  setup do
    @garantia_promotor = garantia_promotors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:garantia_promotors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create garantia_promotor" do
    assert_difference('GarantiaPromotor.count') do
      post :create, garantia_promotor: { edifici_id: @garantia_promotor.edifici_id, referencia: @garantia_promotor.referencia, tipus: @garantia_promotor.tipus, venciment: @garantia_promotor.venciment }
    end

    assert_redirected_to garantia_promotor_path(assigns(:garantia_promotor))
  end

  test "should show garantia_promotor" do
    get :show, id: @garantia_promotor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @garantia_promotor
    assert_response :success
  end

  test "should update garantia_promotor" do
    patch :update, id: @garantia_promotor, garantia_promotor: { edifici_id: @garantia_promotor.edifici_id, referencia: @garantia_promotor.referencia, tipus: @garantia_promotor.tipus, venciment: @garantia_promotor.venciment }
    assert_redirected_to garantia_promotor_path(assigns(:garantia_promotor))
  end

  test "should destroy garantia_promotor" do
    assert_difference('GarantiaPromotor.count', -1) do
      delete :destroy, id: @garantia_promotor
    end

    assert_redirected_to garantia_promotors_path
  end
end
