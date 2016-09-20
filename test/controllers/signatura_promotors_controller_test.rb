require 'test_helper'

class SignaturaPromotorsControllerTest < ActionController::TestCase
  setup do
    @signatura_promotor = signatura_promotors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:signatura_promotors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create signatura_promotor" do
    assert_difference('SignaturaPromotor.count') do
      post :create, signatura_promotor: { edifici_id: @signatura_promotor.edifici_id, promotor_nom_representant: @signatura_promotor.promotor_nom_representant, promotor_rao_social: @signatura_promotor.promotor_rao_social }
    end

    assert_redirected_to signatura_promotor_path(assigns(:signatura_promotor))
  end

  test "should show signatura_promotor" do
    get :show, id: @signatura_promotor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @signatura_promotor
    assert_response :success
  end

  test "should update signatura_promotor" do
    patch :update, id: @signatura_promotor, signatura_promotor: { edifici_id: @signatura_promotor.edifici_id, promotor_nom_representant: @signatura_promotor.promotor_nom_representant, promotor_rao_social: @signatura_promotor.promotor_rao_social }
    assert_redirected_to signatura_promotor_path(assigns(:signatura_promotor))
  end

  test "should destroy signatura_promotor" do
    assert_difference('SignaturaPromotor.count', -1) do
      delete :destroy, id: @signatura_promotor
    end

    assert_redirected_to signatura_promotors_path
  end
end
