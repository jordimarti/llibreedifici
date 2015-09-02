require 'test_helper'

class RegimPropietatsControllerTest < ActionController::TestCase
  setup do
    @regim_propietat = regim_propietats(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regim_propietats)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regim_propietat" do
    assert_difference('RegimPropietat.count') do
      post :create, regim_propietat: { document_escriptura: @regim_propietat.document_escriptura, edifici_id: @regim_propietat.edifici_id, tipus_regim_propietat: @regim_propietat.tipus_regim_propietat }
    end

    assert_redirected_to regim_propietat_path(assigns(:regim_propietat))
  end

  test "should show regim_propietat" do
    get :show, id: @regim_propietat
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regim_propietat
    assert_response :success
  end

  test "should update regim_propietat" do
    patch :update, id: @regim_propietat, regim_propietat: { document_escriptura: @regim_propietat.document_escriptura, edifici_id: @regim_propietat.edifici_id, tipus_regim_propietat: @regim_propietat.tipus_regim_propietat }
    assert_redirected_to regim_propietat_path(assigns(:regim_propietat))
  end

  test "should destroy regim_propietat" do
    assert_difference('RegimPropietat.count', -1) do
      delete :destroy, id: @regim_propietat
    end

    assert_redirected_to regim_propietats_path
  end
end
