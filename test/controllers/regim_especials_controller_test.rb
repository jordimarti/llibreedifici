require 'test_helper'

class RegimEspecialsControllerTest < ActionController::TestCase
  setup do
    @regim_especial = regim_especials(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:regim_especials)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create regim_especial" do
    assert_difference('RegimEspecial.count') do
      post :create, regim_especial: { edifici_id: @regim_especial.edifici_id, referencia_document: @regim_especial.referencia_document, tipus_regim_especial: @regim_especial.tipus_regim_especial }
    end

    assert_redirected_to regim_especial_path(assigns(:regim_especial))
  end

  test "should show regim_especial" do
    get :show, id: @regim_especial
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @regim_especial
    assert_response :success
  end

  test "should update regim_especial" do
    patch :update, id: @regim_especial, regim_especial: { edifici_id: @regim_especial.edifici_id, referencia_document: @regim_especial.referencia_document, tipus_regim_especial: @regim_especial.tipus_regim_especial }
    assert_redirected_to regim_especial_path(assigns(:regim_especial))
  end

  test "should destroy regim_especial" do
    assert_difference('RegimEspecial.count', -1) do
      delete :destroy, id: @regim_especial
    end

    assert_redirected_to regim_especials_path
  end
end
